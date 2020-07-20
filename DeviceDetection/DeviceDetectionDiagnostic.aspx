<%@ Page language="c#" %>
<%@ Import Namespace= "Sitecore.CES.DeviceDetection" %>

<script runat="server">

  void Page_Load(object sender, System.EventArgs e) 
  {
  	Context.Response.Write("DeviceDetectionManager Enabled: " + DeviceDetectionManager.IsEnabled.ToString());
    Context.Response.Write("<br><br>");
	
	Context.Response.Write("DeviceDetectionManager IsReady: " + DeviceDetectionManager.IsReady.ToString());
    Context.Response.Write("<br><br>");
	
    if ( HttpContext.Current == null ||  HttpContext.Current.Request == null)
        {
            Context.Response.Write("Current Context or Request is null");
            Context.Response.Write("<br><br>");

        } else
        {
            var request = HttpContext.Current.Request;

            var useragent = request.Headers["User-Agent"].ToString();


            if (useragent == null)
            {
                Context.Response.Write("useragent is null!");
                Context.Response.Write("<br><br>");

            } else
            {
                Context.Response.Write("useragent: " + useragent);
                Context.Response.Write("<br><br>");

                var deviceInfo = DeviceDetectionManager.GetDeviceInformation(useragent);
                {
                    if (deviceInfo == null)
                    {
                        Context.Response.Write("deviceInfo is null");
                        Context.Response.Write("<br><br>");

                    } else
                    {
                        var deviceType = deviceInfo.DeviceType;
                        Context.Response.Write("deviceType: " + deviceType.ToString());
                        Context.Response.Write("<br><br>");
                    }
                }

            }

            var isMobile = request.Browser.IsMobileDevice;

            Context.Response.Write("isMobile: " + isMobile.ToString());
            Context.Response.Write("<br><br>");
        }

        var device =    Sitecore.CES.DeviceDetection.DeviceDetectionManager.GetDeviceInformation("Mozilla/5.0 (iPad; CPU OS 11_2_1 like Mac OS X) AppleWebKit/604.4.7 (KHTML, like Gecko) Version/11.0 Mobile/15C153 Safari/604.1");
        var type =      device.DeviceType;
        Context.Response.Write("Custom agent - Tablet: " + type.ToString());
        Context.Response.Write("<br><br>");

        device =    Sitecore.CES.DeviceDetection.DeviceDetectionManager.GetDeviceInformation("Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Mobile Safari/537.36");
        type =      device.DeviceType;
        Context.Response.Write("Custom agent - Mobile: " + type.ToString());
        Context.Response.Write("<br><br>");

        device =    Sitecore.CES.DeviceDetection.DeviceDetectionManager.GetDeviceInformation("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36");
        type =      device.DeviceType;
        Context.Response.Write("Custom agent - Computer: " + type.ToString());
        Context.Response.Write("<br><br>");
        
  }
</script>