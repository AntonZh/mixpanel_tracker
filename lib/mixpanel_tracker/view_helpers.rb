module MixpanelTracker
  module ViewHelpers
    def include_mixpanel
      include_mixpanel_library + include_mixpanel_tracker
    end

    def include_mixpanel_library
      ('<script type="text/javascript">(function(e,b){if(!b.__SV){var a,f,i,g;window.mixpanel=b;a=e.createElement("script");a.type="text/javascript";a.async=!0;a.src=("https:"===e.location.protocol?"https:":"http:")+' + "'//cdn.mxpnl.com/libs/mixpanel-2.2.min.js'" + ';f=e.getElementsByTagName("script")[0];f.parentNode.insertBefore(a,f);b._i=[];b.init=function(a,e,d){function f(b,h){var a=h.split(".");2==a.length&&(b=b[a[0]],h=a[1]);b[h]=function(){b.push([h].concat(Array.prototype.slice.call(arguments,0)))}}var c=b;"undefined"!==typeof d?c=b[d]=[]:d="mixpanel";c.people=c.people||[];c.toString=function(b){var a="mixpanel";"mixpanel"!==d&&(a+="."+d);b||(a+=" (stub)");return a};c.people.toString=function(){return c.toString(1)+".people (stub)"};i="disable track track_pageview track_links track_forms register register_once alias unregister identify name_tag set_config people.set people.set_once people.increment people.append people.track_charge people.clear_charges people.delete_user".split(" ");for(g=0;g<i.length;g++)f(c,i[g]);b._i.push([a,e,d])};b.__SV=1.2}})(document,window.mixpanel||[]);mixpanel.init("' + MixpanelTracker.configuration.access_token + '");</script>').html_safe
    end

    def include_mixpanel_tracker
      res = ""
      if session[:mixpanel_events].try(:any?)
        if MixpanelTracker.configuration.register_utm_params
          res += "mixpanel.register_once({utm_source: '#{params[:utm_source]}',utm_medium: '#{params[:utm_medium]}', utm_campaign: '#{params[:utm_campaign]}'});"
        end

        session[:mixpanel_events].each do |e|
          res += "mixpanel.track('#{e.name}', #{e.args.to_json});"
        end
        session.delete(:mixpanel_events)
      end
      res = "/*#{res}*/" if MixpanelTracker.configuration.disabled?
      "<script type=\"text/javascript\">if (typeof(mixpanel) != 'undefined' && mixpanel != null) { #{res} }</script>".html_safe
    end
  end
end
