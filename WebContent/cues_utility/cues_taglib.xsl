<xsl:stylesheet version="1.0" 
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
 xmlns:cues="http://www.cisco.com"
 xmlns:cueslookup="http://www.cisco.com/cues/lookup"
 xmlns:xhtml="http://www.w3.org/1999/xhtml"
 exclude-result-prefixes="cues xhtml cueslookup">

<!-- Include english strings at lower precedence than strings of desired locale -->
<xsl:import href="cuesStrings_en.xsl"/>
<xsl:include href="cuesStrings_en.xsl"/>

<!-- skin/theme support -->
<xsl:include href="cuesSkin_base.xsl"/>

<xsl:output method="xml"/>

<xsl:strip-space elements="cues:modelrow"/>

<xsl:param name="CUESBUILDVERSION">6.2; built on 2010-10-25@23:10:21</xsl:param>

<xsl:param name="CUESKNOWNLOCATION">./</xsl:param>
<xsl:param name="ISIE">1</xsl:param>
<xsl:param name="ISIE6">0</xsl:param>
<xsl:param name="ISFF">0</xsl:param>
<xsl:param name="ISSAFARI">0</xsl:param>
<xsl:param name="RTL">0</xsl:param>

<xsl:param name="PROCESSSUPPORTFILES">0</xsl:param>

<xsl:variable name="maxPageLinks">5</xsl:variable>

<xsl:param name="LOCALE">en</xsl:param>
<!-- app strings -->
<xsl:param name="APPSTRINGS">cuesModelAppStrings.xsl</xsl:param>
<xsl:param name="APPSTRINGSDOC" select="document($APPSTRINGS)/*"/>
<!-- brand strings -->
<xsl:param name="BRANDSTRINGS">cuesModelBrandStrings.xsl</xsl:param>
<xsl:param name="BRANDSTRINGSDOC" select="document($BRANDSTRINGS)/*"/>
<!-- cues strings -->
<xsl:param name="CUESSTRINGS">cuesStrings_en.xsl</xsl:param>
<xsl:param name="CUESSTRINGSDOC" select="document($CUESSTRINGS)/*"/>

<xsl:template match="/"> 
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="br"> 
  <br />
</xsl:template>

<xsl:template match="script"> 
  <script>
    <xsl:comment>
    <xsl:apply-templates select="@*|node()"/>
    </xsl:comment>
  </script>
</xsl:template>

<xsl:template match="cues:supportfiles">
  <xsl:if test="$PROCESSSUPPORTFILES='1'">
    <script>
      <xsl:attribute name="src">
        <xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_utility/cues_taglib.js</xsl:text>
      </xsl:attribute>
    <xsl:text> </xsl:text>
    </script>

    <xsl:if test="$CUESSTYLEVERSION >= 60 and $CUESSTYLEVERSION &lt; 62">
      <script>
        <xsl:attribute name="src">
          <xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_utility/cues_fonts.js</xsl:text>
        </xsl:attribute>
      <xsl:text> </xsl:text>
      </script>
    </xsl:if>

    <link rel="stylesheet" type="text/css" id="cuesCSS">
      <xsl:attribute name="href">
        <xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_utility/</xsl:text><xsl:value-of select="$CUESCSS"/>
      </xsl:attribute>
    </link>

    <xsl:if test="$CUESSTYLEVERSION >= 60">
      <script>
        <xsl:attribute name="src">
          <xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_utility/cues_drawn.js</xsl:text>
        </xsl:attribute>
      <xsl:text> </xsl:text>
      </script>
    </xsl:if>

    <xsl:if test="$CUESSTYLEVERSION >= 63 and @clienttree='true'">
      <script>
        <xsl:attribute name="src">
          <xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_utility/cues_clienttree.js</xsl:text>
        </xsl:attribute>
      <xsl:text> </xsl:text>
      </script>
    </xsl:if>

  </xsl:if>

  <script>
    <xsl:text>cuesKnownLocation='</xsl:text><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>';</xsl:text>
    <xsl:text>cuesImageFolder='</xsl:text><xsl:value-of select="$CUESIMAGES"/><xsl:text>';</xsl:text>
    <xsl:text>cuesVersion='</xsl:text><xsl:value-of select="$CUESSTYLEVERSION"/><xsl:text>';</xsl:text>
    <xsl:text>cuesImageSuffix='</xsl:text><xsl:value-of select="$CUESIMAGEVERSIONSUFFIX"/><xsl:text>';</xsl:text>
    <xsl:text>icuesBackgroundImage="</xsl:text><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/</xsl:text><xsl:value-of select="$CUESBACKGROUNDIMAGE"/><xsl:text>";</xsl:text>

    <xsl:text>cuesCSSFile="</xsl:text><xsl:value-of select="$CUESCSS"/><xsl:text>";</xsl:text>

    <xsl:text>var cuesMsg = new Array();</xsl:text>    
    <xsl:text>cuesMsg["InvalidData"]="</xsl:text><xsl:value-of select="$msgInvalidData"/><xsl:text>";</xsl:text>
    <xsl:text>cuesMsg["NoncontiguousReorder"]="</xsl:text><xsl:value-of select="$msgNoncontiguousReorder"/><xsl:text>";</xsl:text>    
    <xsl:text>cuesMsg["EmptyRow"]="</xsl:text><xsl:value-of select="$emptyrow"/><xsl:text>";</xsl:text>
    
    <xsl:text>var cuesMaskeditFormatError = new Array();</xsl:text>
    <xsl:text>cuesMaskeditFormatError["mac"]="</xsl:text><xsl:value-of select="$msgInvalidData.mac"/><xsl:text>";</xsl:text>
    <xsl:text>cuesMaskeditFormatError["time2"]="</xsl:text><xsl:value-of select="$msgInvalidData.time2"/><xsl:text>";</xsl:text>
    <xsl:text>cuesMaskeditFormatError["miltime2"]="</xsl:text><xsl:value-of select="$msgInvalidData.miltime2"/><xsl:text>";</xsl:text>
    <xsl:text>cuesMaskeditFormatError["netmask"]="</xsl:text><xsl:value-of select="$msgInvalidData.netmask"/><xsl:text>";</xsl:text>
    <xsl:text>cuesMaskeditFormatError["ipv4"]="</xsl:text><xsl:value-of select="$msgInvalidData.ipv4"/><xsl:text>";</xsl:text>
    <xsl:text>cuesMaskeditFormatError["ipv6"]="</xsl:text><xsl:value-of select="$msgInvalidData.ipv6"/><xsl:text>";</xsl:text>
    <xsl:text>cuesMaskeditFormatError["ipv6mask"]="</xsl:text><xsl:value-of select="$msgInvalidData.ipv6mask"/><xsl:text>";</xsl:text>
    
    <xsl:text>var cuesAlt = new Array();</xsl:text>    
    <xsl:text>cuesAlt["ExpandDrawer"]="</xsl:text><xsl:value-of select="$expanddrawer"/><xsl:text>";</xsl:text>
    <xsl:text>cuesAlt["CollapseDrawer"]="</xsl:text><xsl:value-of select="$collapsedrawer"/><xsl:text>";</xsl:text>
    <xsl:text>cuesAlt["ExpandNav"]="</xsl:text><xsl:value-of select="$expandnav"/><xsl:text>";</xsl:text>
    <xsl:text>cuesAlt["CollapseNav"]="</xsl:text><xsl:value-of select="$collapsenav"/><xsl:text>";</xsl:text>
    <xsl:text>cuesAlt["ExpandTree"]="</xsl:text><xsl:value-of select="$expandtree"/><xsl:text>";</xsl:text>
    <xsl:text>cuesAlt["CollapseTree"]="</xsl:text><xsl:value-of select="$collapsetree"/><xsl:text>";</xsl:text>
    <xsl:text>cuesAlt["LeafTree"]="</xsl:text><xsl:value-of select="$leaf"/><xsl:text>";</xsl:text>
    <xsl:text>cuesAlt["WizardStepErrorState"]="</xsl:text><xsl:value-of select="$msgStepHasErrors"/><xsl:text>";</xsl:text>
    <xsl:text>cuesAlt["TabErrorState"]="</xsl:text><xsl:value-of select="$msgTabHasErrors"/><xsl:text>";</xsl:text>
    <xsl:text>cuesAlt["CriticalErrorMessage"]="</xsl:text><xsl:value-of select="$criticalerrormessage"/><xsl:text>";</xsl:text>
    <xsl:text>cuesAlt["ErrorMessage"]="</xsl:text><xsl:value-of select="$errormessage"/><xsl:text>";</xsl:text>
    <xsl:text>cuesAlt["WarningMessage"]="</xsl:text><xsl:value-of select="$warningmessage"/><xsl:text>";</xsl:text>
    <xsl:text>cuesAlt["SuccessMessage"]="</xsl:text><xsl:value-of select="$successmessage"/><xsl:text>";</xsl:text>
    <xsl:text>cuesAlt["InformationalMessage"]="</xsl:text><xsl:value-of select="$informationalmessage"/><xsl:text>";</xsl:text>

    <xsl:text>var cuesACP = new Array();</xsl:text>    
    <xsl:text>cuesACP['Alert']="</xsl:text><xsl:value-of select="$alert"/><xsl:text>";</xsl:text>
    <xsl:text>cuesACP['Confirm']="</xsl:text><xsl:value-of select="$confirm"/><xsl:text>";</xsl:text>
    <xsl:text>cuesACP['Prompt']="</xsl:text><xsl:value-of select="$prompt"/><xsl:text>";</xsl:text>
    <xsl:text>cuesACP['OK']="</xsl:text><xsl:value-of select="$ok"/><xsl:text>";</xsl:text>
    <xsl:text>cuesACP['Cancel']="</xsl:text><xsl:value-of select="$cancel"/><xsl:text>";</xsl:text>
    <xsl:text>cuesACP['Yes']="</xsl:text><xsl:value-of select="$yes"/><xsl:text>";</xsl:text>
    <xsl:text>cuesACP['No']="</xsl:text><xsl:value-of select="$no"/><xsl:text>";</xsl:text>
  </script>
</xsl:template>

<xsl:template match="cues:contentdirection">
  <xsl:choose>
    <xsl:when test="$RTL='1'">
      <script>try{document.body.dir='RTL';}catch(e){}</script>
    </xsl:when>
    <xsl:otherwise>
      <script>try{document.body.dir='LTR';}catch(e){}</script>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>


<xsl:template match="cues:about">
  <xsl:choose>
    <xsl:when test="$CUESSTYLEVERSION >= 62">
      <div id="cuesAboutBackground">
        <xsl:apply-templates select="cues:aboutproduct"/>
        <xsl:apply-templates select="cues:aboutversion"/>
        <xsl:apply-templates select="cues:aboutlicense"/>
        <table><tr><td valign="bottom" width="100%">
          <xsl:apply-templates select="cues:aboutcopyright"/>
        </td><td valign="bottom">
          <img onload="cuesFixPNG(null,this);setTimeout('cuesResizeAboutWindowToContent()',50);" id="cuesHeaderLogoImage">
            <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/<xsl:value-of select="$CUESABOUTIMAGE"/></xsl:attribute>
            <xsl:attribute name="title"><xsl:value-of select="$companylogo"/></xsl:attribute>
            <xsl:attribute name="alt"><xsl:value-of select="$companylogo"/></xsl:attribute>
          </img>
        </td></tr></table>
      </div>
      <div id="cuesAboutShadow">&#160;</div>
      <script>
        <xsl:text>icuesLoginBackgroundImage="</xsl:text><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/</xsl:text><xsl:value-of select="$CUESLOGINBACKGROUNDIMAGE"/><xsl:text>";</xsl:text>
        if(cuesDrawnShape==null)cuesDrawnShape=new icuesDrawnShape();
        if (document.addEventListener)
          window.addEventListener("load", cuesResizeAboutWindowToContent, false);
        else if (document.attachEvent)
          window.attachEvent("onload", cuesResizeAboutWindowToContent);
      </script>
    </xsl:when>
    <xsl:when test="$CUESSTYLEVERSION >= 60">
      <xsl:apply-templates select="cues:aboutproduct"/>
      <xsl:apply-templates select="cues:aboutversion"/>
      <xsl:apply-templates select="cues:aboutlicense"/>
      <table><tr><td valign="bottom" width="100%">
        <xsl:apply-templates select="cues:aboutcopyright"/>
      </td><td valign="bottom">
        <img onload="cuesFixPNG(null,this);setTimeout('cuesResizeAboutWindowToContent()',50);" id="cuesHeaderLogoImage">
          <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/<xsl:value-of select="$CUESABOUTIMAGE"/></xsl:attribute>
          <xsl:attribute name="title"><xsl:value-of select="$companylogo"/></xsl:attribute>
          <xsl:attribute name="alt"><xsl:value-of select="$companylogo"/></xsl:attribute>
        </img>
      </td></tr></table>
      <script>
        if (document.addEventListener)
          window.addEventListener("load", cuesResizeAboutWindowToContent, false);
        else if (document.attachEvent)
          window.attachEvent("onload", cuesResizeAboutWindowToContent);
      </script>
    </xsl:when>
    <xsl:otherwise>
      <table width="460px" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="top" class="cuesAboutBannerLeft" style="padding-left:18px" width="100%">
            <img class="cuesAboutLogo" onload="cuesFixPNG(null,this)" id="cuesLogoImage" align="absmiddle" title="Cisco" alt="Cisco">
              <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/<xsl:value-of select="$CUESABOUTIMAGE"/></xsl:attribute>
            </img>
          </td>
          <td valign="top" class="cuesAboutBannerRight" style="padding-right:11px">
            <xsl:apply-templates select="cues:aboutlicenseinfo"/>
          </td>
        </tr>
      </table>
      <table width="460px" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="top" class="cuesAboutMainLeft" style="padding-left:18px">
            <xsl:apply-templates select="cues:aboutproduct"/>
            <br/>
            <xsl:apply-templates select="cues:aboutversion"/>
          </td>
          <td valign="top" class="cuesAboutMainRight">
            <img title="" alt="">
              <xsl:attribute name="src"><xsl:value-of select="@image"/></xsl:attribute>
            </img>
          </td>
        </tr>
        <tr>
          <td class="cuesAboutFooterLeft">&#160;</td>
          <td class="cuesAboutFooterRight">&#160;</td>
        </tr>
      </table>
      <xsl:apply-templates select="cues:aboutcopyright"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
<xsl:template match="cues:aboutproduct">
  <div>
    <xsl:attribute name="class">
      <xsl:text>cuesAboutProductName</xsl:text>
      <xsl:if test="$RTL='1'">RTL</xsl:if>
    </xsl:attribute>
    <xsl:apply-templates/>
  </div>
</xsl:template>
<xsl:template match="cues:aboutversion">
  <div>
    <xsl:attribute name="class">
      <xsl:text>cuesAboutVersionInfo</xsl:text>
      <xsl:if test="$RTL='1'">RTL</xsl:if>
    </xsl:attribute>
    <xsl:apply-templates/>
  </div>
</xsl:template>
<xsl:template match="cues:aboutcopyright">
  <div id="cuesAboutCopyright">
    <xsl:attribute name="class">
      <xsl:text>cuesAboutCopyright</xsl:text>
      <xsl:if test="$RTL='1'">RTL</xsl:if>
    </xsl:attribute>
    <xsl:apply-templates/>
  </div>
  <script>cuesResizeCopyright();</script>
</xsl:template>
<xsl:template match="cues:aboutlicenseinfo">
  <div>
    <xsl:attribute name="class">
      <xsl:text>cuesAboutLicenseInfo</xsl:text>
      <xsl:if test="$RTL='1'">RTL</xsl:if>
    </xsl:attribute>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="cues:background">
  <xsl:variable name="classname">
    <xsl:choose>
      <xsl:when test="@classname">
        <xsl:value-of select="@classname"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>cuesBackGroundImage</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="image">
    <xsl:choose>
      <xsl:when test="@image">
        <xsl:value-of select="@image"/>
      </xsl:when>
      <xsl:when test="@usage='login'">
        <xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/</xsl:text><xsl:value-of select="$CUESLOGINBACKGROUNDIMAGE"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/</xsl:text><xsl:value-of select="$CUESBACKGROUNDIMAGE"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:if test="$CUESSTYLEVERSION >= 60">
    <div class="cuesBackground">
      <img title="" alt="">
        <xsl:attribute name="class"><xsl:value-of select="$classname"/></xsl:attribute>
        <xsl:attribute name="src"><xsl:value-of select="$image"/></xsl:attribute>
      </img>
    </div>
  </xsl:if>
</xsl:template>

<xsl:template match="cues:productbanner">
  <xsl:variable name="virtualLeft">
    <xsl:choose>
      <xsl:when test="$RTL='1'">right</xsl:when>
      <xsl:otherwise>left</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="virtualRight">
    <xsl:choose>
      <xsl:when test="$RTL='1'">left</xsl:when>
      <xsl:otherwise>right</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td valign="top" class="cuesAboutMainLeft">
        <xsl:attribute name="style">width:100%;padding-<xsl:value-of select="$virtualLeft"/>:18px</xsl:attribute>
        <xsl:apply-templates select="cues:bannerproduct"/>
        <br/>
        <xsl:apply-templates select="cues:bannerversion"/>
      </td>
      <td valign="top" class="cuesAboutMainRight">
        <img title="" alt="">
          <xsl:attribute name="src"><xsl:value-of select="@image"/></xsl:attribute>
        </img>
      </td>
    </tr>
    <tr>
      <td class="cuesAboutFooterLeft" style="width:100%;">&#160;</td>
      <td class="cuesAboutFooterRight">&#160;</td>
    </tr>
  </table>
  <xsl:apply-templates select="cues:bannercopyright"/>
</xsl:template>
<xsl:template match="cues:bannerproduct">
  <div class="cuesAboutProductName">
    <xsl:apply-templates/>
  </div>
</xsl:template>
<xsl:template match="cues:bannerversion">
  <div class="cuesAboutVersionInfo">
    <xsl:apply-templates/>
  </div>
</xsl:template>
<xsl:template match="cues:bannercopyright">
  <div id="cuesAboutCopyright" class="cuesAboutCopyright">
    <xsl:apply-templates/>
  </div>
  <script>cuesResizeCopyright();</script>
</xsl:template>

<xsl:template match="cues:breadcrumb">
  <div style="width:100%;">
    <table cellapdding="0" cellspacing="0" border="0" id="cuesBreadcrumbTable" class="cuesBreadcrumbTable">
      <tr>
        <td nowrap="yes">
          <span id="cuesBreadcrumbStatic" class="cuesBreadcrumbStatic">.</span>
        </td>
        <td style="display:none" nowrap="yes" class="cuesBreadcrumbMore">...&#160;&gt;&#160;</td>
      </tr>
    </table>
  </div>
</xsl:template>

<!-- cues:buttonmenu id=foo caption=text onclick=action disabled=true/false tooltip=text suffix=text -->
<xsl:template match="cues:buttonmenu">
  <xsl:variable name="onclick">
    <xsl:choose>
      <xsl:when test="@onclick = ''"><xsl:text>javascript:void()</xsl:text></xsl:when>
      <xsl:when test="not(@onclick)"><xsl:text>javascript:void()</xsl:text></xsl:when>
      <xsl:otherwise><xsl:value-of select="@onclick"/></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="divider">
    <xsl:choose>
      <xsl:when test="@onclick = ''"></xsl:when>
      <xsl:when test="not(@onclick)"></xsl:when>
      <xsl:otherwise>|</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="buttonPad">
    <xsl:choose>
      <xsl:when test="$ISIE='0'">&#160;&#160;&#160;</xsl:when>
      <xsl:otherwise></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="forcemenu">
    <xsl:choose>
      <xsl:when test="@onclick = ''">true</xsl:when>
      <xsl:when test="not(@onclick)">true</xsl:when>
      <xsl:otherwise>false</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="menuposition">
    <xsl:choose>
      <xsl:when test="$ISFF='1' and $RTL='1'">before</xsl:when>
      <xsl:otherwise>after</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="virtualright">
    <xsl:choose>
      <xsl:when test="$RTL='1'">left</xsl:when>
      <xsl:otherwise>right</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:if test="$menuposition='before'">
    <span style="z-index:99;position:relative;" dir="RTL">
      <span class="cuesRTLgap">&#160;</span>
      <div style="display:none;position:absolute;top:0px;left:0px;">
        <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>menu</xsl:text></xsl:attribute>
        <ul>
          <xsl:attribute name="class">
            <xsl:text>cuesButtonMenu</xsl:text>
            <xsl:if test="$ISIE='1'"><xsl:text> cuesButtonMenuIE</xsl:text></xsl:if>
            <xsl:choose>
              <xsl:when test="$RTL='1'"><xsl:text> cuesButtonMenuRTL</xsl:text></xsl:when>
              <xsl:otherwise><xsl:text> cuesButtonMenuLTR</xsl:text></xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
          <xsl:apply-templates/>
        </ul>
        <xsl:if test="$ISIE='1'">
          <iframe style="border:0px;position:absolute;top:0px;left:0px;z-index:-1;">
            <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>block</xsl:text></xsl:attribute>
            <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_utility/cues_blank.html</xsl:attribute>
            block
          </iframe>
        </xsl:if>
      </div>
    </span>
  </xsl:if>
  <button type="button" onkeydown="return cuesButtonMenuOnKeyHandler(this,event)">
    <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
    <xsl:attribute name="onclick"><xsl:text>cuesButtonMenuClick(this, event,</xsl:text><xsl:value-of select="$forcemenu"/><xsl:text>)</xsl:text></xsl:attribute>
    <xsl:attribute name="href"><xsl:value-of select="$onclick"/></xsl:attribute>
    <xsl:if test="@disabled = 'true'">
      <xsl:attribute name="disabled">yes</xsl:attribute>
    </xsl:if>
    <xsl:attribute name="title">
      <xsl:call-template name="lookup">
        <xsl:with-param name="key" select="@tooltip"/>
        <xsl:with-param name="keyed" select="@tooltipaskey"/>
        <xsl:with-param name="locale" select="@setLocale"/>
      </xsl:call-template>
    </xsl:attribute>
    <xsl:attribute name="style">
      <xsl:choose>
        <xsl:when test="$ISIE='1' and $RTL='0'">
          <xsl:text>padding-right:5px;</xsl:text>
        </xsl:when>
        <xsl:when test="$ISIE='1' and $RTL='1'">
          <xsl:text>padding-left:5px;</xsl:text>
        </xsl:when>
        <xsl:when test="$ISIE='0'">
          <xsl:text>padding:0px;margin:0px;</xsl:text>
        </xsl:when>
        <xsl:otherwise>display:none;height:0px;</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>

    <div>
      <xsl:attribute name="style">
        <xsl:text>background-repeat:no-repeat;background-position:</xsl:text>
        <xsl:value-of select="$virtualright"/>
        <xsl:text>;background-image:url('</xsl:text><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/benu-arrow.gif')</xsl:text></xsl:attribute>
      <xsl:call-template name="lookup">
        <xsl:with-param name="key" select="@caption"/>
        <xsl:with-param name="keyed" select="@captionaskey"/>
        <xsl:with-param name="locale" select="@setLocale"/>
      </xsl:call-template>
      <xsl:value-of select="@suffix"/>
      <xsl:text>&#160;</xsl:text>
      <xsl:value-of select="$divider"/>
      <xsl:value-of select="$buttonPad"/>
    </div>
  </button>
  <xsl:if test="$menuposition='after'">
    <span style="z-index:99;position:relative;">
      <div style="display:none;position:absolute;top:0px;left:0px;">
        <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>menu</xsl:text></xsl:attribute>
        <ul>
          <xsl:attribute name="class">
            <xsl:text>cuesButtonMenu</xsl:text>
            <xsl:if test="$ISIE='1'"><xsl:text> cuesButtonMenuIE</xsl:text></xsl:if>
            <xsl:choose>
              <xsl:when test="$RTL='1'"><xsl:text> cuesButtonMenuRTL</xsl:text></xsl:when>
              <xsl:otherwise><xsl:text> cuesButtonMenuLTR</xsl:text></xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
          <xsl:apply-templates/>
        </ul>
        <xsl:if test="$ISIE='1'">
          <iframe style="border:0px;position:absolute;top:0px;left:0px;z-index:-1;">
            <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>block</xsl:text></xsl:attribute>
            <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_utility/cues_blank.html</xsl:attribute>
            block
          </iframe>
        </xsl:if>
      </div>
    </span>
  </xsl:if>
  <script><xsl:text>cuesSetButtonmenuState('</xsl:text><xsl:value-of select="@id"/><xsl:text>');</xsl:text></script>
</xsl:template>

<xsl:template match="cues:menuitemseparator">
</xsl:template>

<!-- cues:menuitem id=foo caption=text onclick=action image=img tooltip=text disabled=true/false suffix=text -->
<xsl:template match="cues:menuitem">
  <xsl:variable name="disabled">
    <xsl:choose>
      <xsl:when test="@disabled='true'">true</xsl:when>
      <xsl:otherwise>false</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="classInfo">
    <xsl:if test="$disabled='true'"><xsl:text>disabled</xsl:text></xsl:if>
    <xsl:if test="local-name(preceding-sibling::*[1])='menuitemseparator'"><xsl:text> dividerAbove</xsl:text></xsl:if>
  </xsl:variable>

  <li>
    <xsl:if test="string-length($classInfo) > 0">
      <xsl:attribute name="class"><xsl:value-of select="$classInfo"/></xsl:attribute>
    </xsl:if>
    <nobr>
    <a>
      <xsl:choose>
        <xsl:when test="local-name(..)='buttonmenu'">
          <xsl:attribute name="onblur"><xsl:text>return cuesButtonMenuOnblurHandler(this, event)</xsl:text></xsl:attribute>
          <xsl:attribute name="onfocus"><xsl:text>return cuesButtonMenuOnfocusHandler(this, event)</xsl:text></xsl:attribute>
        </xsl:when>
        <xsl:when test="local-name(..)='popupmenu'">
          <xsl:attribute name="onblur"><xsl:text>return cuesButtonMenuOnblurHandler(this, event)</xsl:text></xsl:attribute>
          <xsl:attribute name="onfocus"><xsl:text>return cuesButtonMenuOnfocusHandler(this, event)</xsl:text></xsl:attribute>
        </xsl:when>
      </xsl:choose>
      <xsl:attribute name="title">
        <xsl:call-template name="lookup">
          <xsl:with-param name="key" select="@tooltip"/>
          <xsl:with-param name="keyed" select="@tooltipaskey"/>
          <xsl:with-param name="locale" select="../@setLocale"/>
        </xsl:call-template>
      </xsl:attribute>
      <xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute></xsl:if>
      <xsl:if test="@image"><xsl:attribute name="class">icon <xsl:value-of select="@image"/></xsl:attribute></xsl:if>
      <xsl:if test="not(@onclick)"><xsl:attribute name="class">nohref</xsl:attribute></xsl:if>
      <xsl:if test="$disabled='true'">
        <xsl:attribute name="savehref"><xsl:value-of select="@onclick"/></xsl:attribute>
      </xsl:if>
      <xsl:if test="$disabled='false'">
        <xsl:attribute name="href"><xsl:value-of select="@onclick"/></xsl:attribute>
      </xsl:if>
      <xsl:choose>
        <xsl:when test="@direction">
          <span>
            <xsl:attribute name="dir"><xsl:value-of select="@direction"/></xsl:attribute>
            <xsl:call-template name="lookup">
              <xsl:with-param name="key" select="@caption"/>
              <xsl:with-param name="keyed" select="@captionaskey"/>
              <xsl:with-param name="locale" select="@setLocale"/>
            </xsl:call-template>
            <xsl:value-of select="@suffix"/>
          </span>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="lookup">
            <xsl:with-param name="key" select="@caption"/>
            <xsl:with-param name="keyed" select="@captionaskey"/>
            <xsl:with-param name="locale" select="@setLocale"/>
          </xsl:call-template>
          <xsl:value-of select="@suffix"/>
        </xsl:otherwise>
      </xsl:choose>
    </a>
    </nobr>
    <xsl:if test="count(descendant::cues:menuitem) > 0">
      <ul class="udmsubmenu">
        <xsl:apply-templates/>
      </ul>
    </xsl:if>
  </li>
</xsl:template>

<xsl:template match="cues:carousel">
  <xsl:variable name="carouselImageExtension">
    <xsl:choose>
      <xsl:when test="$ISIE6='1'">gif</xsl:when>
      <xsl:otherwise>png</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="w">
    <xsl:choose>
      <xsl:when test="$ISIE='1'"><xsl:value-of select="@itemwidth"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="@itemwidth - 2"/></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="h">
    <xsl:choose>
      <xsl:when test="$ISIE='1'"><xsl:value-of select="@itemheight"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="@itemheight - 2"/></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <script>
    if(typeof(cuesCarousel)=="undefined")
      <xsl:text>cuesLoadScript("</xsl:text><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_utility/cues_taglib_carousel.js");</xsl:text>
    function cuesCarouselLoader(id, itemsPer, itemHeight, itemWidth)
    {
      // wait for support file to be loaded
      if(typeof(cuesCarousel)=="undefined")
        setTimeout("cuesCarouselLoader('"+id+"',"+itemsPer+","+itemHeight+","+itemWidth+")",50);
      else
        new cuesCarousel(id, itemsPer, itemHeight, itemWidth);
    }
  </script>
  <div class="cuesCarousel">
    <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
    <div class="cuesCarouselLights">
      <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>.lights</xsl:text></xsl:attribute>
      <a class="cuesCarouselLight" href="javascript:void(0)">
        <xsl:attribute name="onclick"><xsl:text>cuesCarousels['</xsl:text><xsl:value-of select="@id"/><xsl:text>'].gotoPage(0)</xsl:text></xsl:attribute>
        <img border="0" alt="ALTTEXT" title="TITLETEXT"
             onmouseout="this.src=this.src.replace('Hover.','Available.')"
             onmouseover="this.src=this.src.replace('Available.','Hover.')">
          <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/carouselLightAvailable.</xsl:text><xsl:value-of select="$carouselImageExtension"/></xsl:attribute>
        </img>  
      </a>
    </div>
    <a class="cuesCarouselSlideLeft" href="javascript:void(0)">
      <xsl:attribute name="onclick"><xsl:text>cuesCarousels['</xsl:text><xsl:value-of select="@id"/><xsl:text>'].showPrevious()</xsl:text></xsl:attribute>
      <img border="0"
           onmouseout="this.src=this.src.replace('LeftHover.','Left.')"
           onmouseover="this.src=this.src.replace('Left.','LeftHover.')">
        <xsl:attribute name="alt"><xsl:value-of select="$previouspage"/></xsl:attribute>
        <xsl:attribute name="title"><xsl:value-of select="$previouspage"/></xsl:attribute>
        <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/carouselScrollLeft.</xsl:text><xsl:value-of select="$carouselImageExtension"/></xsl:attribute>
      </img>
    </a>
    <div class="cuesCarouselPane">
      <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>.pane</xsl:text></xsl:attribute>          
      <div class="cuesCarouselItems">
        <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>.items</xsl:text></xsl:attribute>
        <xsl:apply-templates/>
      </div>
    </div>
    <a class="cuesCarouselSlideRight" href="javascript:void(0)">
      <xsl:attribute name="onclick"><xsl:text>cuesCarousels['</xsl:text><xsl:value-of select="@id"/><xsl:text>'].showNext()</xsl:text></xsl:attribute>
      <img border="0"
           onmouseout="this.src=this.src.replace('RightHover.','Right.')"
           onmouseover="this.src=this.src.replace('Right.','RightHover.')">
        <xsl:attribute name="alt"><xsl:value-of select="$nextpage"/></xsl:attribute>
        <xsl:attribute name="title"><xsl:value-of select="$nextpage"/></xsl:attribute>
        <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/carouselScrollRight.</xsl:text><xsl:value-of select="$carouselImageExtension"/></xsl:attribute>
      </img>
    </a>
  </div>
  <script>
    <xsl:text>var altGotoPage = new Array();</xsl:text>
    <xsl:text>altGotoPage[0]="</xsl:text><xsl:value-of select="$gotopage1"/><xsl:text>";</xsl:text>
    <xsl:text>altGotoPage[1]="</xsl:text><xsl:value-of select="$gotopage2"/><xsl:text>";</xsl:text>
    <xsl:text>altGotoPage[2]="</xsl:text><xsl:value-of select="$gotopage3"/><xsl:text>";</xsl:text>
    <xsl:text>altGotoPage[3]="</xsl:text><xsl:value-of select="$gotopage4"/><xsl:text>";</xsl:text>
    <xsl:text>altGotoPage[4]="</xsl:text><xsl:value-of select="$gotopage5"/><xsl:text>";</xsl:text>
    <xsl:text>altGotoPage[5]="</xsl:text><xsl:value-of select="$gotopage6"/><xsl:text>";</xsl:text>
    <xsl:text>altGotoPage[6]="</xsl:text><xsl:value-of select="$gotopage7"/><xsl:text>";</xsl:text>
    <xsl:text>altGotoPage[7]="</xsl:text><xsl:value-of select="$gotopage8"/><xsl:text>";</xsl:text>
    <xsl:text>altGotoPage[8]="</xsl:text><xsl:value-of select="$gotopage9"/><xsl:text>";</xsl:text>
    <xsl:text>altGotoPage[9]="</xsl:text><xsl:value-of select="$gotopage10"/><xsl:text>";</xsl:text>
    <xsl:text>new cuesCarouselLoader("</xsl:text><xsl:value-of select="@id"/><xsl:text>",</xsl:text><xsl:value-of select="@itemsper"/><xsl:text>,</xsl:text><xsl:value-of select="@itemheight"/><xsl:text>,</xsl:text><xsl:value-of select="@itemwidth"/><xsl:text>);</xsl:text>
  </script>
</xsl:template>
<xsl:template match="cues:carouselitem">
  <xsl:variable name="w">
    <xsl:choose>
      <xsl:when test="$ISIE='1'"><xsl:value-of select="../@itemwidth"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="../@itemwidth - 2"/></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="h">
    <xsl:choose>
      <xsl:when test="$ISIE='1'"><xsl:value-of select="../@itemheight"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="../@itemheight - 2"/></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <div class="cuesCarouselItem">
    <xsl:attribute name="style">
      <xsl:text>width:</xsl:text><xsl:value-of select="$w"/><xsl:text>;</xsl:text>
      <xsl:text>height:</xsl:text><xsl:value-of select="$h"/><xsl:text>;</xsl:text>
    </xsl:attribute>          
    <div class="cuesCarouselLayer">
      <xsl:attribute name="style">
        <xsl:text>width:</xsl:text><xsl:value-of select="$w"/><xsl:text>;</xsl:text>
        <xsl:text>height:</xsl:text><xsl:value-of select="$h"/><xsl:text>;</xsl:text>
      </xsl:attribute>
    &#160;</div>
    <xsl:choose>
      <xsl:when test="../@imageplacement='above'">
        <img>
          <xsl:attribute name="alt"><xsl:value-of select="@tooltip"/></xsl:attribute>
          <xsl:attribute name="title"><xsl:value-of select="@tooltip"/></xsl:attribute>
          <xsl:attribute name="src"><xsl:value-of select="@image"/></xsl:attribute>
        </img>
        <br/>
      </xsl:when>
      <xsl:otherwise>
        <img class="cuesCarouselImage">
          <xsl:attribute name="alt"><xsl:value-of select="@tooltip"/></xsl:attribute>
          <xsl:attribute name="title"><xsl:value-of select="@tooltip"/></xsl:attribute>
          <xsl:attribute name="src"><xsl:value-of select="@image"/></xsl:attribute>
        </img>
      </xsl:otherwise>
    </xsl:choose>            
    <div class="cuesCarouselContent">
      <a style="visibility:hidden;" class="cuesCarouselTitle">
        <xsl:if test="@target">
          <xsl:attribute name="target"><xsl:value-of select="@target"/></xsl:attribute>
        </xsl:if>
        <xsl:attribute name="href"><xsl:value-of select="@titlehref"/></xsl:attribute>
        <xsl:value-of select="@title"/>
      </a>
      <div>
        <xsl:apply-templates/>
      </div>
    </div>
  </div>
</xsl:template>

<xsl:template match="cues:clip">
  <div style="display:none" onmouseout="icuesSetClipTooltip(this)">
    <xsl:attribute name="id"><xsl:value-of select="@id"/>.Partial</xsl:attribute>
    <xsl:attribute name="onmouseover">icuesSetClipTooltip(this,'<xsl:value-of select="@id"/>.Full')</xsl:attribute>
    <xsl:text>...</xsl:text>
  </div>
  <div style="display:inline">
    <xsl:attribute name="id"><xsl:value-of select="@id"/>.Full</xsl:attribute>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="cues:combobox[@model='true']">
  <div style="display:none;">
    <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>.model</xsl:text></xsl:attribute>
    <xsl:call-template name="cuescombobox"/>
  </div>
</xsl:template>
<xsl:template match="cues:combobox">
  <xsl:call-template name="cuescombobox"/>
</xsl:template>
<xsl:template name="cuescombobox">
  <xsl:variable name="filtered">
    <xsl:choose>
      <xsl:when test="@filtered"><xsl:value-of select="@filtered"/></xsl:when>
      <xsl:otherwise>true</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="ajaxurl">
    <xsl:choose>
      <xsl:when test="@ajaxurl"><xsl:value-of select="@ajaxurl"/></xsl:when>
      <xsl:otherwise><xsl:text/></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <div>
    <xsl:attribute name="class"><xsl:text>cuesComboboxContainer</xsl:text>
      <xsl:choose>
        <xsl:when test="$ISIE='1'"><xsl:text>IE</xsl:text></xsl:when>
        <xsl:otherwise><xsl:text>FF</xsl:text></xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:choose>
      <xsl:when test="$CUESSTYLEVERSION >= 60">
        <div class="cuesCombobox">   
          <input class="cuesComboboxInput" type="text" onkeypress="return cuesComboboxOnKeyHandler(event, this)">
            <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
            <xsl:attribute name="size"><xsl:value-of select="@size"/></xsl:attribute>
            <xsl:if test="@disabled='true'"><xsl:attribute name="disabled">true</xsl:attribute></xsl:if>
            <xsl:if test="@name"><xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute></xsl:if>
            <xsl:if test="@value"><xsl:attribute name="value"><xsl:value-of select="@value"/></xsl:attribute></xsl:if>
            <xsl:if test="@onchange"><xsl:attribute name="onchange"><xsl:value-of select="@onchange"/></xsl:attribute></xsl:if>
            <xsl:attribute name="onblur">cuesComboboxOnBlurHandler(null,'<xsl:value-of select="@id"/>_choices')</xsl:attribute>
          </input>  
          <img class="cuesComboboxArrow">
            <xsl:attribute name="alt"><xsl:value-of select="$showchoices"/></xsl:attribute>
            <xsl:attribute name="title"><xsl:value-of select="$showchoices"/></xsl:attribute>
            <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/ComboboxArrow.gif</xsl:text></xsl:attribute>
            <xsl:attribute name="onclick">cuesComboboxShowChoices('<xsl:value-of select="@id"/>')</xsl:attribute>
          </img>
          <span style="visibility:hidden;">&#160;</span>
        </div>
      </xsl:when>
      <xsl:otherwise>
        <input type="text" onkeypress="return cuesComboboxOnKeyHandler(event, this)">
          <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
          <xsl:attribute name="size"><xsl:value-of select="@size"/></xsl:attribute>
          <xsl:if test="@disabled='true'"><xsl:attribute name="disabled">true</xsl:attribute></xsl:if>
          <xsl:if test="@name"><xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute></xsl:if>
          <xsl:if test="@value"><xsl:attribute name="value"><xsl:value-of select="@value"/></xsl:attribute></xsl:if>
          <xsl:if test="@onchange"><xsl:attribute name="onchange"><xsl:value-of select="@onchange"/></xsl:attribute></xsl:if>
          <xsl:attribute name="onblur">cuesComboboxOnBlurHandler(null,'<xsl:value-of select="@id"/>_choices')</xsl:attribute>
        </input>  
        <img>
          <xsl:attribute name="alt"><xsl:value-of select="$showchoices"/></xsl:attribute>
          <xsl:attribute name="title"><xsl:value-of select="$showchoices"/></xsl:attribute>
          <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/drawerScrollDown.gif</xsl:text></xsl:attribute>
          <xsl:attribute name="onclick">cuesComboboxShowChoices('<xsl:value-of select="@id"/>')</xsl:attribute>
        </img>    
      </xsl:otherwise>
    </xsl:choose>
    <br style="font:1px"/>
    <div class="cuesComboboxList">
      <select class="cuesComboboxChoices" size="6"
          onblur="cuesComboboxOnBlurHandler(this)"
          onfocus="return cuesComboboxOnFocusHandler(this)">
        <xsl:attribute name="id"><xsl:value-of select="@id"/>_choices</xsl:attribute>
        <xsl:attribute name="filtered"><xsl:value-of select="$filtered"/></xsl:attribute>
        <xsl:attribute name="ajaxurl"><xsl:value-of select="$ajaxurl"/></xsl:attribute>
        <xsl:attribute name="onkeypress">return cuesComboboxChoiceMade(event,this,'<xsl:value-of select="@id"/>');</xsl:attribute>
        <xsl:attribute name="onclick">cuesComboboxOnChangeHandler(event,this,'<xsl:value-of select="@id"/>',true);</xsl:attribute>
        <xsl:attribute name="onchange">cuesComboboxOnChangeHandler(event,this,'<xsl:value-of select="@id"/>');</xsl:attribute>
        <xsl:if test="@expandowner='true'">
          <xsl:attribute name="style">position:relative;</xsl:attribute>
        </xsl:if>
        <option/>
      </select>
    </div>
    <xml style="display:none">
      <xsl:attribute name="id"><xsl:value-of select="@id"/>_totalchoices</xsl:attribute>
      <choices>
        <xsl:apply-templates/>
      </choices>
    </xml>
  </div>
</xsl:template>

<!-- cues:contentarea indent=#/ -->
<xsl:template match="cues:contentarea">
  <div id="cuesContentArea" style="width:100%;height:100%;overflow:auto;position:relative;">
    <xsl:apply-templates/>
  </div>
  <script>
  if (document.addEventListener)
    window.addEventListener('resize', icuesOnresizeHandler, false);
  else if (document.attachEvent)
    window.attachEvent('onresize', icuesOnresizeHandler);
  icuesResizeContent(<xsl:value-of select="@indent"/>);  
  </script>
</xsl:template>

<xsl:template match="cues:tabset">
  <xsl:if test="$CUESSTYLEVERSION >= 60">
    <script>
      if(cuesDrawnShape==null)cuesDrawnShape=new icuesDrawnShape();
    </script>
  </xsl:if>
  <div class="cuesTabContentRowBg">
    <table border="0" cellspacing="0" cellpadding="0">
      <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
      <tbody>
        <tr>
          <xsl:choose>
            <xsl:when test="$CUESSTYLEVERSION >= 60">
              <xsl:apply-templates select="cues:tab" mode="title60"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:apply-templates select="cues:tab" mode="title5x"/>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:if test="$CUESSTYLEVERSION >= 60">
            <td class="cuesTabFiller">&#160;</td>
          </xsl:if>
        </tr>
      </tbody>
    </table>
  </div>
  <xsl:if test="$CUESSTYLEVERSION >= 60">
    <script>
    <xsl:apply-templates select="cues:tab" mode="draw"/>
    </script>
  </xsl:if>
  <xsl:apply-templates select="cues:tab" mode="content"/>
</xsl:template>

<xsl:template match="cues:tab" mode="title5x">
  <xsl:variable name="tabindex"><xsl:value-of select="count(preceding-sibling::cues:tab)"/></xsl:variable>
  <xsl:variable name="tabid"><xsl:value-of select="../@id"/><xsl:text>_</xsl:text><xsl:value-of select="$tabindex"/></xsl:variable>
  <xsl:variable name="active">
    <xsl:choose>
      <xsl:when test="@active"><xsl:value-of select="@active"/></xsl:when>
      <xsl:otherwise>false</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="onclick">
    <xsl:choose>
      <xsl:when test="@onclick"><xsl:value-of select="@onclick"/></xsl:when>
      <xsl:otherwise>javascript:cuesToggleTab('<xsl:value-of select="../@id"/>',<xsl:value-of select="$tabindex"/>,false,false)</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <td valign="bottom">
    <xsl:attribute name="active"><xsl:value-of select="$active"/></xsl:attribute>
    <xsl:if test="$active='true'">
      <table class="cuesActiveTab" border="0" cellspacing="0" cellpadding="0" onclick="javascript:cuesInvokeTab(event, this)" onKeyPress="javascript:cuesInvokeTab(event, this)">
        <tr>
          <td>
            <img alt="" title="">
              <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/tabLeftActiveContent.gif</xsl:attribute>
            </img>
          </td>
          <td class="cuesTabBgActiveContent">
            <xsl:if test="@haserrors='true'">
              <img class="cuesTabErrorIndicator">
                <xsl:attribute name="title"><xsl:value-of select="$msgTabHasErrors"/></xsl:attribute>
                <xsl:attribute name="alt"><xsl:value-of select="$msgTabHasErrors"/></xsl:attribute>
                <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_icons/statuserror_12.gif</xsl:attribute>
              </img>
            </xsl:if>
            <a class="cuesTabLink">
              <xsl:attribute name="id"><xsl:text>cuesid_</xsl:text><xsl:value-of select="$tabid"/></xsl:attribute>
              <xsl:attribute name="onfocus">cuesTabOnFocusHandler(event,'<xsl:value-of select="../@id"/>',<xsl:value-of select="$tabindex"/>)</xsl:attribute>
              <xsl:attribute name="onclick">icuesPreTabCallback('<xsl:value-of select="../@id"/>',<xsl:value-of select="$tabindex"/>)</xsl:attribute>
              <xsl:attribute name="href"><xsl:value-of select="$onclick"/></xsl:attribute>
              <nobr>
                <xsl:call-template name="lookup">
                  <xsl:with-param name="key" select="@title"/>
                  <xsl:with-param name="keyed" select="@titleaskey"/>
                  <xsl:with-param name="locale" select="../@setLocale"/>
                </xsl:call-template>
                <span class="cuesTabLabel">&#160;tab</span>
              </nobr>
            </a>
          </td>
          <td>
            <img alt="" title="">
              <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/tabRightActiveContent.gif</xsl:attribute>
            </img>
          </td>
        </tr>
      </table>
    </xsl:if>
    <xsl:if test="$active='false'">
      <table class="cuesNonactiveTab" border="0" cellpadding="0" cellspacing="0" onclick="javascript:cuesInvokeTab(event, this)" onKeyPress="javascript:cuesInvokeTab(event, this)">
        <tr>
          <xsl:choose>
            <xsl:when test="preceding-sibling::cues:tab[1][@active='true']">
              <td>
                <img title="" alt="">
                  <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/tabLeftNonActiveAdjacent.gif</xsl:attribute>
                </img>
              </td>
              <td class="cuesTabBgNonActiveContent">
                <xsl:if test="@haserrors='true'">
                  <img class="cuesTabErrorIndicator">
                    <xsl:attribute name="title"><xsl:value-of select="$msgTabHasErrors"/></xsl:attribute>
                    <xsl:attribute name="alt"><xsl:value-of select="$msgTabHasErrors"/></xsl:attribute>
                    <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_icons/statuserror_12.gif</xsl:attribute>
                  </img>
                </xsl:if>
                <a class="cuesTabLink">
                  <xsl:attribute name="id"><xsl:text>cuesid_</xsl:text><xsl:value-of select="$tabid"/></xsl:attribute>
                  <xsl:attribute name="onfocus">cuesTabOnFocusHandler(event,'<xsl:value-of select="../@id"/>',<xsl:value-of select="$tabindex"/>)</xsl:attribute>
                  <xsl:attribute name="onclick">icuesPreTabCallback('<xsl:value-of select="../@id"/>',<xsl:value-of select="$tabindex"/>)</xsl:attribute>
                  <xsl:attribute name="href"><xsl:value-of select="$onclick"/></xsl:attribute>
                  <nobr>
                    <xsl:call-template name="lookup">
                      <xsl:with-param name="key" select="@title"/>
                      <xsl:with-param name="keyed" select="@titleaskey"/>
                      <xsl:with-param name="locale" select="../@setLocale"/>
                    </xsl:call-template>
                    <span class="cuesTabLabel">&#160;tab</span>
                  </nobr>
                </a>
              </td>
              <td>
                <img title="" alt="">
                  <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/tabRightNonActive.gif</xsl:attribute>
                </img>
              </td>
            </xsl:when>
            <xsl:when test="following-sibling::cues:tab[1][@active='true']">
              <td>
                <img alt="" title="">
                  <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/tabLeftNonActive.gif</xsl:attribute>
                </img>
              </td>
              <td class="cuesTabBgNonActiveContent">
                <xsl:if test="@haserrors='true'">
                  <img class="cuesTabErrorIndicator">
                    <xsl:attribute name="title"><xsl:value-of select="$msgTabHasErrors"/></xsl:attribute>
                    <xsl:attribute name="alt"><xsl:value-of select="$msgTabHasErrors"/></xsl:attribute>
                    <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_icons/statuserror_12.gif</xsl:attribute>
                  </img>
                </xsl:if>
                <a class="cuesTabLink">
                  <xsl:attribute name="id"><xsl:text>cuesid_</xsl:text><xsl:value-of select="$tabid"/></xsl:attribute>
                  <xsl:attribute name="onfocus">cuesTabOnFocusHandler(event,'<xsl:value-of select="../@id"/>',<xsl:value-of select="$tabindex"/>)</xsl:attribute>
                  <xsl:attribute name="onclick">icuesPreTabCallback('<xsl:value-of select="../@id"/>',<xsl:value-of select="$tabindex"/>)</xsl:attribute>
                  <xsl:attribute name="href"><xsl:value-of select="$onclick"/></xsl:attribute>
                  <nobr>
                    <xsl:call-template name="lookup">
                      <xsl:with-param name="key" select="@title"/>
                      <xsl:with-param name="keyed" select="@titleaskey"/>
                      <xsl:with-param name="locale" select="../@setLocale"/>
                    </xsl:call-template>
                    <span class="cuesTabLabel">&#160;tab</span>
                  </nobr>
                </a>
              </td>
              <td>
                <img title="" alt="">
                  <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/tabRightNonActiveAdjacent.gif</xsl:attribute>
                </img>
              </td>
            </xsl:when>

            <xsl:otherwise>
              <td>
                <img alt="" title="">
                  <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/tabLeftNonActive.gif</xsl:attribute>
                </img>
              </td>
              <td class="cuesTabBgNonActiveContent">
                <xsl:if test="@haserrors='true'">
                  <img class="cuesTabErrorIndicator">
                    <xsl:attribute name="title"><xsl:value-of select="$msgTabHasErrors"/></xsl:attribute>
                    <xsl:attribute name="alt"><xsl:value-of select="$msgTabHasErrors"/></xsl:attribute>
                    <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_icons/statuserror_12.gif</xsl:attribute>
                  </img>
                </xsl:if>
                <a class="cuesTabLink">
                  <xsl:attribute name="id"><xsl:text>cuesid_</xsl:text><xsl:value-of select="$tabid"/></xsl:attribute>
                  <xsl:attribute name="onfocus">cuesTabOnFocusHandler(event,'<xsl:value-of select="../@id"/>',<xsl:value-of select="$tabindex"/>)</xsl:attribute>
                  <xsl:attribute name="onclick">icuesPreTabCallback('<xsl:value-of select="../@id"/>',<xsl:value-of select="$tabindex"/>)</xsl:attribute>
                  <xsl:attribute name="href"><xsl:value-of select="$onclick"/></xsl:attribute>
                  <nobr>
                    <xsl:call-template name="lookup">
                      <xsl:with-param name="key" select="@title"/>
                      <xsl:with-param name="keyed" select="@titleaskey"/>
                      <xsl:with-param name="locale" select="../@setLocale"/>
                    </xsl:call-template>
                    <span class="cuesTabLabel">&#160;tab</span>
                  </nobr>
                </a>
              </td>
              <td>
                <img title="" alt="">
                  <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/tabRightNonActive.gif</xsl:attribute>
                </img>
              </td>
            </xsl:otherwise>

          </xsl:choose>
        </tr>
      </table>
    </xsl:if>
  </td>
</xsl:template>
<xsl:template match="cues:tab" mode="title60">
  <xsl:variable name="tabindex"><xsl:value-of select="count(preceding-sibling::cues:tab)"/></xsl:variable>
  <xsl:variable name="tabid"><xsl:value-of select="../@id"/><xsl:text>_</xsl:text><xsl:value-of select="$tabindex"/></xsl:variable>
  <xsl:variable name="active">
    <xsl:choose>
      <xsl:when test="@active"><xsl:value-of select="@active"/></xsl:when>
      <xsl:otherwise>false</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="tabclass">
    <xsl:choose>
      <xsl:when test="@active='true'">cuesTab cuesTabCaptionActive</xsl:when>
      <xsl:otherwise>cuesTab cuesTabCaptionInactive</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="onclick">
    <xsl:choose>
      <xsl:when test="@onclick"><xsl:value-of select="@onclick"/></xsl:when>
      <xsl:otherwise>javascript:cuesToggleTab('<xsl:value-of select="../@id"/>',<xsl:value-of select="$tabindex"/>,false,false)</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <td class="cuesTabGap">&#160;</td>
  <td nowrap="yes">
    <div onclick="cuesInvokeTab(event,this)">
      <xsl:attribute name="id"><xsl:value-of select="../@id"/>_<xsl:value-of select="$tabindex"/>_tab</xsl:attribute>
      <xsl:attribute name="class"><xsl:value-of select="$tabclass"/></xsl:attribute>
      <xsl:attribute name="onmouseover">cuesDrawnShape.tabMouseover('<xsl:value-of select="../@id"/>',<xsl:value-of select="$tabindex"/>)</xsl:attribute>
      <xsl:attribute name="onmouseout">cuesDrawnShape.tabMouseout('<xsl:value-of select="../@id"/>',<xsl:value-of select="$tabindex"/>)</xsl:attribute>
      <div class="cuesTabCaption">
        <xsl:if test="@haserrors='true'">
          <img class="cuesTabErrorIndicator">
            <xsl:attribute name="title"><xsl:value-of select="$msgTabHasErrors"/></xsl:attribute>
            <xsl:attribute name="alt"><xsl:value-of select="$msgTabHasErrors"/></xsl:attribute>
            <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_icons/statuserror_12.gif</xsl:text></xsl:attribute>
          </img>
        </xsl:if>
        <a class="cuesTabLink">
            <xsl:attribute name="id"><xsl:text>cuesid_</xsl:text><xsl:value-of select="$tabid"/></xsl:attribute>
            <xsl:attribute name="onfocus">cuesDrawnShape.tabMouseover('<xsl:value-of select="../@id"/>',<xsl:value-of select="$tabindex"/>)</xsl:attribute>
            <xsl:attribute name="onblur">cuesDrawnShape.tabMouseout('<xsl:value-of select="../@id"/>',<xsl:value-of select="$tabindex"/>)</xsl:attribute>
            <xsl:attribute name="onclick">return icuesPreTabCallback('<xsl:value-of select="../@id"/>',<xsl:value-of select="$tabindex"/>)</xsl:attribute>
            <xsl:attribute name="href"><xsl:value-of select="$onclick"/></xsl:attribute>
            <nobr>
              <xsl:call-template name="lookup">
                <xsl:with-param name="key" select="@title"/>
                <xsl:with-param name="keyed" select="@titleaskey"/>
                <xsl:with-param name="locale" select="../@setLocale"/>
              </xsl:call-template>
            </nobr>
          </a>
      </div>
    </div>
  </td>
</xsl:template>
<xsl:template match="cues:tab" mode="draw">
  <xsl:variable name="tabindex"><xsl:value-of select="count(preceding-sibling::cues:tab)"/></xsl:variable>
  <xsl:variable name="tabid"><xsl:value-of select="../@id"/><xsl:text>_</xsl:text><xsl:value-of select="$tabindex"/></xsl:variable>
  <xsl:variable name="active">
    <xsl:choose>
      <xsl:when test="@active"><xsl:value-of select="@active"/></xsl:when>
      <xsl:otherwise>false</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  cuesDrawnShape.makeTab('<xsl:value-of select="../@id"/>',<xsl:value-of select="$tabindex"/>,<xsl:value-of select="$active"/>);
</xsl:template>
<xsl:template match="cues:tab" mode="content">
  <xsl:variable name="tabindex"><xsl:value-of select="count(preceding-sibling::cues:tab)"/></xsl:variable>
  <xsl:variable name="tabid"><xsl:value-of select="../@id"/><xsl:text>_</xsl:text><xsl:value-of select="$tabindex"/></xsl:variable>
  <xsl:variable name="active">
    <xsl:choose>
      <xsl:when test="@active"><xsl:value-of select="@active"/></xsl:when>
      <xsl:otherwise>false</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <div>
    <xsl:attribute name="class">
      <xsl:choose>
        <xsl:when test="$ISIE='1'">cuesTabContainer cuesTabContainerIE</xsl:when>
        <xsl:otherwise>cuesTabContainer cuesTabContainerFF</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:attribute name="id"><xsl:value-of select="$tabid"/></xsl:attribute>
    <xsl:attribute name="style">
      <xsl:if test="$active='false'"><xsl:text>display:none;</xsl:text></xsl:if>
      <xsl:if test="../@height"><xsl:text>height:</xsl:text><xsl:value-of select="../@height"/></xsl:if>
    </xsl:attribute>
    <xsl:apply-templates/>
    <xsl:if test="$CUESSTYLEVERSION >= 60">
      <div class="cuesTabContainerLayer">&#160;</div>
    </xsl:if>
  </div>
</xsl:template>


<!-- cues:contenttitle text=string helplink=url helptarget=string -->
<xsl:template match="cues:contenttitle">
  <xsl:variable name="helptarget">
    <xsl:choose>
      <xsl:when test="@helptarget"><xsl:value-of select="@helptarget"/></xsl:when>
      <xsl:otherwise>helpwindow</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <div width="100%" class="cuesContentTitle">
    <xsl:call-template name="lookup">
      <xsl:with-param name="key" select="@text"/>
      <xsl:with-param name="keyed" select="@textaskey"/>
      <xsl:with-param name="locale" select="@setLocale"/>
    </xsl:call-template>
    <xsl:if test="@helplink">
      <span id="cuesContentTitleHelpLink">
        <a class="cuesBreadcrumbLink">
          <xsl:attribute name="href"><xsl:value-of select="@helplink"/></xsl:attribute>
          <xsl:attribute name="target"><xsl:value-of select="$helptarget"/></xsl:attribute>
          <xsl:value-of select="$help"/>
        </a>
      </span>
    </xsl:if>    
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="cues:dashboard">
  <xsl:variable name="virtualcolumns"><xsl:value-of select="6 div @numcolumns"/></xsl:variable>
  <script>
    <xsl:text>cuesLoadScript("</xsl:text><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_utility/cues_taglib_dashboard.js");</xsl:text>
    <xsl:if test="$CUESSTYLEVERSION >= 60">
      if(cuesDrawnShape==null)cuesDrawnShape=new icuesDrawnShape();
    </xsl:if>
  </script>
  <table id="cuesDashboard" cellpadding="0" cellspacing="0" width="100%">
    <xsl:if test="@dnd='true'">
      <xsl:attribute name="onselectstart"><xsl:text>return false</xsl:text></xsl:attribute>
      <xsl:attribute name="onmouseover"><xsl:text>return cuesPaneOver(event, false, this)</xsl:text></xsl:attribute>
    </xsl:if>
    <col width="16%"/>
    <col width="16%"/>
    <col width="16%"/>
    <col width="16%"/>
    <col width="16%"/>
    <col width="16%"/>
    <tr>
    <xsl:for-each select="cues:dashboardpane">
      <xsl:variable name="span">
        <xsl:choose>
          <xsl:when test="@span"><xsl:value-of select="@span"/></xsl:when>
          <xsl:otherwise>1</xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:variable name="colspan">
        <xsl:value-of select="$virtualcolumns * $span"/>
      </xsl:variable>
      <xsl:variable name="priorspan">
        <xsl:choose>
          <xsl:when test="preceding-sibling::cues:dashboardpane[1][@span]"><xsl:value-of select="preceding-sibling::cues:dashboardpane[1]/@span"/></xsl:when>
          <xsl:otherwise>1</xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:variable name="priorcol">
        <xsl:choose>
          <xsl:when test="preceding-sibling::cues:dashboardpane"><xsl:value-of select="preceding-sibling::cues:dashboardpane[1]/@column"/></xsl:when>
          <xsl:otherwise>1</xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:choose>
        <xsl:when test="@column = $priorcol and $span = $priorspan">
          <xsl:if test="not(preceding-sibling::cues:dashboardpane)">
            <xsl:call-template name="starttablecell">
              <xsl:with-param name="class"><xsl:text>cuesDashboardCell</xsl:text></xsl:with-param>
              <xsl:with-param name="colspan"><xsl:value-of select="$virtualcolumns * $span"/></xsl:with-param>
            </xsl:call-template>
          </xsl:if>
          <xsl:apply-templates select="."/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:if test="preceding-sibling::cues:dashboardpane">
            <xsl:call-template name="endtablecell"/>
          </xsl:if>
          <xsl:choose>
            <xsl:when test="@column &lt; $priorcol">
              <xsl:call-template name="endtablerow"/>
              <xsl:call-template name="starttablerow"/>
              <xsl:if test="@column=2"><td colspan="2">&#160;</td></xsl:if>
              <xsl:if test="@column=3"><td colspan="4">&#160;</td></xsl:if>
              <xsl:call-template name="starttablecell">
                <xsl:with-param name="class"><xsl:text>cuesDashboardCell</xsl:text></xsl:with-param>
                <xsl:with-param name="colspan"><xsl:value-of select="$virtualcolumns * $span"/></xsl:with-param>
              </xsl:call-template>
              <xsl:apply-templates select="."/>
            </xsl:when>
            <xsl:when test="@column - $priorcol &gt; 1">
              <td class="cuesDashboardCell" colspan="2">&#160;</td>
              <xsl:call-template name="starttablecell">
                <xsl:with-param name="class"><xsl:text>cuesDashboardCell</xsl:text></xsl:with-param>
                <xsl:with-param name="colspan"><xsl:value-of select="$virtualcolumns * $span"/></xsl:with-param>
              </xsl:call-template>
              <xsl:apply-templates select="."/>
            </xsl:when>
            <xsl:when test="@column &gt; $priorcol">
              <xsl:call-template name="starttablecell">
                <xsl:with-param name="class"><xsl:text>cuesDashboardCell</xsl:text></xsl:with-param>
                <xsl:with-param name="colspan"><xsl:value-of select="$virtualcolumns * $span"/></xsl:with-param>
              </xsl:call-template>
              <xsl:apply-templates select="."/>
            </xsl:when>
            <xsl:when test="@column = $priorcol">              
              <xsl:if test="preceding-sibling::cues:dashboardpane">
                <xsl:call-template name="endtablerow"/>
                <xsl:call-template name="starttablerow"/>
              </xsl:if>

              <xsl:if test="@column=2"><td class="cuesDashboardCell" colspan="2">&#160;</td></xsl:if>
              <xsl:if test="@column=3"><td class="cuesDashboardCell" colspan="4">&#160;</td></xsl:if>
              <xsl:call-template name="starttablecell">
                <xsl:with-param name="class"><xsl:text>cuesDashboardCell</xsl:text></xsl:with-param>
                <xsl:with-param name="colspan"><xsl:value-of select="$virtualcolumns * $span"/></xsl:with-param>
              </xsl:call-template>
              <xsl:apply-templates select="."/>
            </xsl:when>
          </xsl:choose>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
    <xsl:call-template name="endtablecell"/>
    </tr>
    <tr style="line-height:1px;">
      <td>&#160;</td>
      <td>&#160;</td>
      <td>&#160;</td>
      <td>&#160;</td>
      <td>&#160;</td>
      <td>&#160;</td>
    </tr>
  </table>
  <xsl:if test="@dnd='true'">
    <div id="cuesDashboardPaneMover">&#160;</div>
  </xsl:if>
</xsl:template>
<xsl:template match="cues:dashboardpane">
  <div class="cuesDashboardPane" state="normal">
    <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>_pane</xsl:text></xsl:attribute>
    <xsl:if test="../@dnd='true'">
      <xsl:attribute name="onmouseover"><xsl:text>return cuesPaneOver(event, true, this)</xsl:text></xsl:attribute>
      <xsl:attribute name="onmousemove"><xsl:text>return cuesPaneMoving(event, true, this)</xsl:text></xsl:attribute>
    </xsl:if>
    <div class="cuesDashboardPaneTitle">
      <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>_title</xsl:text></xsl:attribute>
      <table width="100%" cellpadding="0" cellspacing="0">
        <tr>
          <xsl:if test="$CUESSTYLEVERSION &lt; 60">
            <td>
              <img>
                <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>Toggler</xsl:text></xsl:attribute>
                <xsl:attribute name="onclick"><xsl:text>cuesTogglePane(this,'</xsl:text><xsl:value-of select="@id"/><xsl:text>')</xsl:text></xsl:attribute>
                <xsl:attribute name="src">
                  <xsl:value-of select="$CUESKNOWNLOCATION"/>
                  <xsl:text>cues_images/PaneCollapse</xsl:text>
                  <xsl:if test="$CUESCSSMODE='highcontrast'"><xsl:text>_HC</xsl:text></xsl:if>
                  <xsl:text>.gif</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="alt"><xsl:value-of select="$togglepane"/></xsl:attribute>
                <xsl:attribute name="title"><xsl:value-of select="$togglepane"/></xsl:attribute>
              </img>
            </td>
          </xsl:if>
          <td nowrap="yes">
            <nobr>
              <span>
                <xsl:choose>
                  <xsl:when test="@onclick">
                    <a>
                      <xsl:attribute name="href"><xsl:value-of select="@onclick"/></xsl:attribute>
                      <xsl:attribute name="target"><xsl:value-of select="@target"/></xsl:attribute>
                      <xsl:call-template name="lookup">
                        <xsl:with-param name="key" select="@title"/>
                        <xsl:with-param name="keyed" select="@titleaskey"/>
                        <xsl:with-param name="locale" select="@setLocale"/>
                      </xsl:call-template>
                    </a>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:call-template name="lookup">
                      <xsl:with-param name="key" select="@title"/>
                      <xsl:with-param name="keyed" select="@titleaskey"/>
                      <xsl:with-param name="locale" select="@setLocale"/>
                    </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>  

                <xsl:if test="@rss">
                  <a class="cuesRSS" target="rsswindow">
                    <xsl:attribute name="href"><xsl:value-of select="@rss"/></xsl:attribute>
                    <img border="0">
                      <xsl:attribute name="alt"><xsl:value-of select="$rssfeed"/></xsl:attribute>
                      <xsl:attribute name="title"><xsl:value-of select="$rssfeed"/></xsl:attribute>
                      <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/rss_12.png</xsl:text></xsl:attribute>
                    </img>
                  </a>
                </xsl:if>

              </span>
            </nobr>
          </td>
          <td width="100%">
            <xsl:if test="../@dnd='true'">
              <xsl:attribute name="class"><xsl:text>cuesDashboardPaneDND</xsl:text></xsl:attribute>
              <xsl:attribute name="onmousedown"><xsl:text>return cuesPaneStartMove(event,this)</xsl:text></xsl:attribute>
            </xsl:if>
            <xsl:text>&#160;</xsl:text>
          </td>
          <td>
            <nobr>
              <span>
                <xsl:text>&#160;</xsl:text>             
                <xsl:if test="$CUESSTYLEVERSION >= 60">
                  <xsl:if test="@editaction">
                    <a>
                      <xsl:attribute name="href"><xsl:value-of select="@editaction"/></xsl:attribute>
                      <xsl:attribute name="onfocus"><xsl:text>return icuesSetIconHoverStateById('</xsl:text><xsl:value-of select="@id"/><xsl:text>Edit',true)</xsl:text></xsl:attribute>
                      <xsl:attribute name="onblur"><xsl:text>return icuesSetIconHoverStateById('</xsl:text><xsl:value-of select="@id"/><xsl:text>Edit',false)</xsl:text></xsl:attribute>
                      <img border="0" onmouseout="return icuesSetIconHoverState(this,false)" onmouseover="return icuesSetIconHoverState(this,true)">
                        <xsl:attribute name="id"><xsl:value-of select="@id"/>Edit</xsl:attribute>
                        <xsl:attribute name="src">
                          <xsl:value-of select="$CUESKNOWNLOCATION"/>
                          <xsl:text>cues_images/PaneEdit</xsl:text>
                          <xsl:if test="$CUESCSSMODE='highcontrast'"><xsl:text>_HC</xsl:text></xsl:if>
                          <xsl:text>.gif</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="alt"><xsl:value-of select="$editthismodule"/></xsl:attribute>
                        <xsl:attribute name="title"><xsl:value-of select="$editthismodule"/></xsl:attribute>
                      </img>
                    </a>
                  </xsl:if>
                  <xsl:if test="@helpaction">
                    <a>
                      <xsl:attribute name="href"><xsl:value-of select="@helpaction"/></xsl:attribute>
                      <xsl:attribute name="onfocus"><xsl:text>return icuesSetIconHoverStateById('</xsl:text><xsl:value-of select="@id"/><xsl:text>Help',true)</xsl:text></xsl:attribute>
                      <xsl:attribute name="onblur"><xsl:text>return icuesSetIconHoverStateById('</xsl:text><xsl:value-of select="@id"/><xsl:text>Help',false)</xsl:text></xsl:attribute>
                      <img border="0" onmouseout="return icuesSetIconHoverState(this,false)" onmouseover="return icuesSetIconHoverState(this,true)">
                        <xsl:attribute name="id"><xsl:value-of select="@id"/>Help</xsl:attribute>
                        <xsl:attribute name="src">
                          <xsl:value-of select="$CUESKNOWNLOCATION"/>
                          <xsl:text>cues_images/PaneHelp</xsl:text>
                          <xsl:if test="$CUESCSSMODE='highcontrast'"><xsl:text>_HC</xsl:text></xsl:if>
                          <xsl:text>.gif</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="alt"><xsl:value-of select="$help"/></xsl:attribute>
                        <xsl:attribute name="title"><xsl:value-of select="$help"/></xsl:attribute>
                      </img>
                    </a>
                  </xsl:if>
                  <xsl:if test="@refreshaction">
                    <a>
                      <xsl:attribute name="href"><xsl:value-of select="@refreshaction"/></xsl:attribute>
                      <xsl:attribute name="onfocus"><xsl:text>return icuesSetIconHoverStateById('</xsl:text><xsl:value-of select="@id"/><xsl:text>Refresh',true)</xsl:text></xsl:attribute>
                      <xsl:attribute name="onblur"><xsl:text>return icuesSetIconHoverStateById('</xsl:text><xsl:value-of select="@id"/><xsl:text>Refresh',false)</xsl:text></xsl:attribute>
                      <img border="0" onmouseout="return icuesSetIconHoverState(this,false)" onmouseover="return icuesSetIconHoverState(this,true)">
                        <xsl:attribute name="id"><xsl:value-of select="@id"/>Help</xsl:attribute>
                        <xsl:attribute name="src">
                          <xsl:value-of select="$CUESKNOWNLOCATION"/>
                          <xsl:text>cues_images/PaneRefresh</xsl:text>
                          <xsl:if test="$CUESCSSMODE='highcontrast'"><xsl:text>_HC</xsl:text></xsl:if>
                          <xsl:text>.gif</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="alt"><xsl:value-of select="$help"/></xsl:attribute>
                        <xsl:attribute name="title"><xsl:value-of select="$help"/></xsl:attribute>
                      </img>
                    </a>
                  </xsl:if>
                  <xsl:if test="not(@collapsable) or @collapsable='true'">
                    <a href="javascript:void(0)">
                      <xsl:attribute name="onfocus"><xsl:text>return icuesSetIconHoverStateById('</xsl:text><xsl:value-of select="@id"/><xsl:text>Toggler',true)</xsl:text></xsl:attribute>
                      <xsl:attribute name="onblur"><xsl:text>return icuesSetIconHoverStateById('</xsl:text><xsl:value-of select="@id"/><xsl:text>Toggler',false)</xsl:text></xsl:attribute>
                      <xsl:attribute name="onclick"><xsl:text>cuesTogglePane(this,'</xsl:text><xsl:value-of select="@id"/><xsl:text>')</xsl:text></xsl:attribute>
                      <img border="0" onmouseout="return icuesSetIconHoverState(this,false)" onmouseover="return icuesSetIconHoverState(this,true)">
                        <xsl:attribute name="id"><xsl:value-of select="@id"/>Toggler</xsl:attribute>
                        <xsl:attribute name="src">
                          <xsl:value-of select="$CUESKNOWNLOCATION"/>
                          <xsl:text>cues_images/PaneMinimize</xsl:text>
                          <xsl:if test="$CUESCSSMODE='highcontrast'"><xsl:text>_HC</xsl:text></xsl:if>
                          <xsl:text>.gif</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="alt"><xsl:value-of select="$collapsepane"/></xsl:attribute>
                        <xsl:attribute name="title"><xsl:value-of select="$collapsepane"/></xsl:attribute>
                      </img>
                    </a>
                  </xsl:if>
                  <xsl:if test="not(@expandable) or @expandable='true'">
                    <a href="javascript:void(0)">
                      <xsl:attribute name="onfocus"><xsl:text>return icuesSetIconHoverStateById('</xsl:text><xsl:value-of select="@id"/><xsl:text>Expand',true)</xsl:text></xsl:attribute>
                      <xsl:attribute name="onblur"><xsl:text>return icuesSetIconHoverStateById('</xsl:text><xsl:value-of select="@id"/><xsl:text>Expand',false)</xsl:text></xsl:attribute>
                      <xsl:attribute name="onclick"><xsl:text>cuesExpandPane(this,'</xsl:text><xsl:value-of select="@id"/><xsl:text>')</xsl:text></xsl:attribute>
                      <img border="0" onmouseout="return icuesSetIconHoverState(this,false)" onmouseover="return icuesSetIconHoverState(this,true)">
                        <xsl:attribute name="id"><xsl:value-of select="@id"/>Expand</xsl:attribute>
                        <xsl:attribute name="src">
                          <xsl:value-of select="$CUESKNOWNLOCATION"/>
                          <xsl:text>cues_images/PaneMaximized</xsl:text>
                          <xsl:if test="$CUESCSSMODE='highcontrast'"><xsl:text>_HC</xsl:text></xsl:if>
                          <xsl:text>.gif</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="alt"><xsl:value-of select="$expandpane"/></xsl:attribute>
                        <xsl:attribute name="title"><xsl:value-of select="$expandpane"/></xsl:attribute>
                      </img>
                    </a>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="not(@closable) or @closable='true'">
                  <xsl:choose>
                    <xsl:when test="$CUESSTYLEVERSION >= 60">
                      <a href="javascript:void(0)">
                        <xsl:attribute name="onfocus"><xsl:text>return icuesSetIconHoverStateById('</xsl:text><xsl:value-of select="@id"/><xsl:text>Closure',true)</xsl:text></xsl:attribute>
                        <xsl:attribute name="onblur"><xsl:text>return icuesSetIconHoverStateById('</xsl:text><xsl:value-of select="@id"/><xsl:text>Closure',false)</xsl:text></xsl:attribute>
                        <xsl:attribute name="onclick"><xsl:text>cuesClosePane(this,'</xsl:text><xsl:value-of select="@id"/><xsl:text>')</xsl:text></xsl:attribute>
                        <img border="0" onmouseout="return icuesSetIconHoverState(this,false)" onmouseover="return icuesSetIconHoverState(this,true)">
                          <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>Closure</xsl:text></xsl:attribute>
                          <xsl:attribute name="src">
                            <xsl:value-of select="$CUESKNOWNLOCATION"/>
                            <xsl:text>cues_images/PaneClose</xsl:text>
                            <xsl:if test="$CUESCSSMODE='highcontrast'"><xsl:text>_HC</xsl:text></xsl:if>
                            <xsl:text>.gif</xsl:text>
                          </xsl:attribute>
                          <xsl:attribute name="alt"><xsl:value-of select="$remove"/></xsl:attribute>
                          <xsl:attribute name="title"><xsl:value-of select="$remove"/></xsl:attribute>
                        </img>
                      </a>
                    </xsl:when>
                    <xsl:otherwise>
                      <img>
                        <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>Closure</xsl:text></xsl:attribute>
                        <xsl:attribute name="onclick"><xsl:text>cuesClosePane(this,'</xsl:text><xsl:value-of select="@id"/><xsl:text>')</xsl:text></xsl:attribute>
                        <xsl:attribute name="src">
                          <xsl:value-of select="$CUESKNOWNLOCATION"/>
                          <xsl:text>cues_images/PaneRemove</xsl:text>
                          <xsl:if test="$CUESCSSMODE='highcontrast'"><xsl:text>_HC</xsl:text></xsl:if>
                          <xsl:text>.gif</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="alt"><xsl:value-of select="$closepane"/></xsl:attribute>
                        <xsl:attribute name="title"><xsl:value-of select="$closepane"/></xsl:attribute>
                      </img>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:if>
              </span>
            </nobr>
          </td>
        </tr>
      </table>
    </div>
    <xsl:if test="$CUESSTYLEVERSION >= 60">
      <script>
        <xsl:text>cuesDrawnShape.makeDashboard('</xsl:text><xsl:value-of select="@id"/><xsl:text>_title');</xsl:text>
      </script>
    </xsl:if>
    <xsl:if test="@status">
      <div class="cuesDashboardPaneStatus">
        <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>_status</xsl:text></xsl:attribute>        
        <xsl:attribute name="class">
          <xsl:choose>
            <xsl:when test="$CUESSTYLEVERSION >= 61 and @statuslevel='critical'">
              <xsl:text>cuesDashboardPaneStatus cuesDashboardPaneCriticalStatus</xsl:text>
            </xsl:when>
            <xsl:otherwise>cuesDashboardPaneStatus</xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>        
        <xsl:if test="$CUESSTYLEVERSION &lt; 60">
          <img alt="" title="">
            <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/PaneStatusGradient.gif</xsl:attribute>
          </img>
        </xsl:if>
        <div>
          <xsl:if test="$CUESSTYLEVERSION >= 61">
            <span class="cuesDashboardPaneStatusLabel">
              <xsl:value-of select="$status"/>
              <xsl:text>:&#160;</xsl:text>
            </span>
            <xsl:if test="@statusicon">
              <img>
                <xsl:attribute name="alt"><xsl:value-of select="$status"/></xsl:attribute>
                <xsl:attribute name="title"><xsl:value-of select="$status"/></xsl:attribute>
                <xsl:attribute name="src"><xsl:value-of select="@statusicon"/></xsl:attribute>
              </img>
            </xsl:if>
          </xsl:if>
          <xsl:call-template name="lookup">
            <xsl:with-param name="key" select="@status"/>
            <xsl:with-param name="keyed" select="@statusaskey"/>
            <xsl:with-param name="locale" select="@setLocale"/>
          </xsl:call-template>
        </div>
        <xsl:if test="$CUESSTYLEVERSION >= 61">
          <div>
            <xsl:attribute name="class">
              <xsl:text>cuesDashboardPane</xsl:text>
              <xsl:choose>
                <xsl:when test="@statuslevel='critical'"><xsl:text>Critical</xsl:text></xsl:when>
                <xsl:otherwise><xsl:text>Normal</xsl:text></xsl:otherwise>
              </xsl:choose>
              <xsl:text>StatusLayer</xsl:text>
            </xsl:attribute>        
            &#160;
          </div>
        </xsl:if>
      </div>
    </xsl:if>
    <div>
      <xsl:attribute name="class">
        <xsl:text>cuesDashboardPaneContent</xsl:text>
        <xsl:if test="$ISIE6='0'">
          <xsl:text> cuesDashboardPaneContentLayer</xsl:text>
        </xsl:if>
      </xsl:attribute>
      <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
      <xsl:apply-templates/>
    </div>
  </div>
</xsl:template>

<xsl:template match="cues:datepicker">
  <xsl:if test="@model='false'">
    <xsl:text>&#160;</xsl:text>
    <img align="absmiddle">
      <xsl:attribute name="alt"><xsl:value-of select="$showdatepicker"/></xsl:attribute>
      <xsl:attribute name="title"><xsl:value-of select="$showdatepicker"/></xsl:attribute>
      <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_icons/DatePicker16.gif</xsl:text></xsl:attribute>
      <xsl:attribute name="onclick"><xsl:value-of select="@onclick"/></xsl:attribute>
    </img>
  </xsl:if>
  <xsl:if test="not(@model)">
    <xsl:text>&#160;</xsl:text>
    <img align="absmiddle">
      <xsl:attribute name="alt"><xsl:value-of select="$showdatepicker"/></xsl:attribute>
      <xsl:attribute name="title"><xsl:value-of select="$showdatepicker"/></xsl:attribute>
      <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_icons/DatePicker16.gif</xsl:text></xsl:attribute>
      <xsl:attribute name="onclick"><xsl:value-of select="@onclick"/></xsl:attribute>
    </img>
  </xsl:if>
  <xsl:if test="count(preceding::cues:datepicker)=0">
    <div id="cuesDatePicker" style="display:none;">

      <xsl:call-template name="starttag"/><xsl:text>div id="cuesDatePickerInner"</xsl:text><xsl:call-template name="endtag"/>

        <div class="cuesDatePickerHeader">
          <center>
            <table cellpadding="0" cellspacing="0">
              <tr style="line-height:26px;height:26px">
                <td valign="middle">
                  <img style="align:absmiddle" border="0" usemap="#cuesdatepickerprev">
                    <xsl:attribute name="alt"><xsl:value-of select="$showpreviousmonth"/></xsl:attribute>
                    <xsl:attribute name="title"><xsl:value-of select="$showpreviousmonth"/></xsl:attribute>
                    <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/datepicker-month-arrow-leftT.gif</xsl:text></xsl:attribute>
                  </img>
                  <map name="cuesdatepickerprev">
                    <area shape="rect" coords="0,0,16,16" href="javascript:cuesDatePickerNavigate(-1)"/>
                  </map>
                </td>
                <td><xsl:text>&#160;&#160;</xsl:text></td>
                <td valign="middle">
                  <select id="cuesDatePickerMonth" size="1" onchange="cuesDatePickerPopulate()">
                    <option value="0"><xsl:value-of select="$jan"/></option>
                    <option value="1"><xsl:value-of select="$feb"/></option>
                    <option value="2"><xsl:value-of select="$mar"/></option>
                    <option value="3"><xsl:value-of select="$apr"/></option>
                    <option value="4"><xsl:value-of select="$may"/></option>
                    <option value="5"><xsl:value-of select="$jun"/></option>
                    <option value="6"><xsl:value-of select="$jul"/></option>
                    <option value="7"><xsl:value-of select="$aug"/></option>
                    <option value="8"><xsl:value-of select="$sep"/></option>
                    <option value="9"><xsl:value-of select="$oct"/></option>
                    <option value="10"><xsl:value-of select="$nov"/></option>
                    <option value="11"><xsl:value-of select="$dec"/></option>
                  </select>
                </td>
                <td><xsl:text>&#160;</xsl:text></td>
                <td valign="middle">
                  <input type="text" id="cuesDatePickerYear" value="2006" size="4" onchange="cuesDatePickerPopulate()"/>
                  <img id="cuesDatePickerSpinner" border="0" usemap="#cuesspinnermap">
                    <xsl:attribute name="alt"><xsl:value-of select="$spinner"/></xsl:attribute>
                    <xsl:attribute name="title"><xsl:value-of select="$spinner"/></xsl:attribute>
                    <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/Spin17T.gif</xsl:text></xsl:attribute>
                    <xsl:attribute name="style">
                      <xsl:text>position:relative;top:</xsl:text>
                      <xsl:choose>
                        <xsl:when test="$ISIE='1'"><xsl:text>2</xsl:text></xsl:when>
                        <xsl:otherwise><xsl:text>4</xsl:text></xsl:otherwise>
                      </xsl:choose>
                    </xsl:attribute>
                  </img>
                  <map name="cuesspinnermap">
                    <area shape="rect" coords="0,0,17,8" href="javascript:cuesDatePickerSpin('cuesDatePickerYear',1)"/>
                    <area shape="rect" coords="0,9,17,17" href="javascript:cuesDatePickerSpin('cuesDatePickerYear',-1)"/>
                  </map>
                </td>
                <td><xsl:text>&#160;&#160;</xsl:text></td>
                <td valign="middle">
                  <img style="vertical-align:text-bottom" border="0" usemap="#cuesdatepickernext">
                    <xsl:attribute name="alt"><xsl:value-of select="$shownextmonth"/></xsl:attribute>
                    <xsl:attribute name="title"><xsl:value-of select="$shownextmonth"/></xsl:attribute>
                    <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/datepicker-month-arrow-rightT.gif</xsl:text></xsl:attribute>
                  </img>
                  <map name="cuesdatepickernext">
                    <area shape="rect" coords="0,0,16,16" href="javascript:cuesDatePickerNavigate(1)"/>
                  </map>
                </td>
              </tr>
            </table>
          </center>
        </div>
        <div style="margin-left:5px;margin-right:5px;">
          <center>
            <table id="cuesDatePickerWeekdays" cellspacing="3" cellpadding="0">
              <col width="16"/>
              <col width="16"/>
              <col width="16"/>
              <col width="16"/>
              <col width="16"/>
              <col width="16"/>
              <col width="16"/>
              <tr align="center">
                <td class="cuesCalWeekdays">S</td>
                <td class="cuesCalWeekdays">M</td>
                <td class="cuesCalWeekdays">T</td>
                <td class="cuesCalWeekdays">W</td>
                <td class="cuesCalWeekdays">T</td>
                <td class="cuesCalWeekdays">F</td>
                <td class="cuesCalWeekdays">S</td>
              </tr>
            </table>
            <a href="javascript:void(0);" class="cuesDatePickerSelector" onclick="return cuesDatePickerSelect(this,event)">
              <table cellspacing="3" id="cuesDatePickerCal" onmouseover="this.style.cursor='pointer'">
                <col width="16"/>
                <col width="16"/>
                <col width="16"/>
                <col width="16"/>
                <col width="16"/>
                <col width="16"/>
                <col width="16"/>
                <xsl:call-template name="datepickercalrow"/>
                <xsl:call-template name="datepickercalrow"/>
                <xsl:call-template name="datepickercalrow"/>
                <xsl:call-template name="datepickercalrow"/>
                <xsl:call-template name="datepickercalrow"/>
                <xsl:call-template name="datepickercalrow"/>
              </table>
            </a>
            <xsl:if test="$CUESSTYLEVERSION &lt; 60">
              <br/>
              <span class="cuesCalToday" style="padding-left:3px;padding-right:3px;">
                <a class="cuesCalTodayLink" id="cuesDatePickerToday" href="javascript:cuesDatePickerSelectToday()" savehref="javascript:cuesDatePickerSelectToday()">
                  <xsl:value-of select="$today"/>
                </a>
              </span>
            </xsl:if>
          </center>
        </div>
        <br/>
      <xsl:if test="$CUESSTYLEVERSION &lt; 60">
        <xsl:call-template name="starttag"/><xsl:text>/div</xsl:text><xsl:call-template name="endtag"/>
      </xsl:if>
      <div class="cuesDatepickerLegend">
        <xsl:if test="$CUESSTYLEVERSION &lt; 60">
          <xsl:call-template name="starttag"/><xsl:text>center</xsl:text><xsl:call-template name="endtag"/>
        </xsl:if>
          <span id="cuesDatePickerLegendSpecial">
            <xsl:text>10</xsl:text>
            <span class="cuesDatePickerLegend">
              <xsl:text>&#160;&#160;</xsl:text>
              <xsl:value-of select="$special"/>
            </span>
          </span>
          <br/>
          <span id="cuesDatePickerLegendBlocked">
            <div>
              <xsl:text>&#160;10&#160;</xsl:text>
            </div>
            <xsl:text>&#160;-&#160;</xsl:text>
            <xsl:value-of select="$blocked"/>
          </span>
        <xsl:if test="$CUESSTYLEVERSION &lt; 60">
          <xsl:call-template name="starttag"/><xsl:text>/center</xsl:text><xsl:call-template name="endtag"/>
        </xsl:if>
      </div>
      <xsl:if test="$CUESSTYLEVERSION >= 60">
        <xsl:call-template name="starttag"/><xsl:text>/div</xsl:text><xsl:call-template name="endtag"/>
      </xsl:if>
      <iframe style="position:absolute;top:0px;left:0px;z-index:-1;width:100%;height:100%;" frameborder="0">
        <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_utility/cues_blank.html</xsl:text></xsl:attribute>
        block
      </iframe>
    </div>
  </xsl:if>
</xsl:template>
<xsl:template name="datepickercalrow">
  <tr align="right">
    <xsl:call-template name="datepickercalcell"/>
    <xsl:call-template name="datepickercalcell"/>
    <xsl:call-template name="datepickercalcell"/>
    <xsl:call-template name="datepickercalcell"/>
    <xsl:call-template name="datepickercalcell"/>
    <xsl:call-template name="datepickercalcell"/>
    <xsl:call-template name="datepickercalcell"/>
  </tr>
</xsl:template>
<xsl:template name="datepickercalcell">
  <td onMouseOver="icuesDatePickerDayOnFocus(this)" onMouseOut="icuesDatePickerDayOnBlur(this)"><xsl:text>&#160;</xsl:text></td>
</xsl:template>

<xsl:template match="cues:drawers">
  <xsl:variable name="mode">
    <xsl:choose>
      <xsl:when test="contains(@mode,'multiple')">multiple</xsl:when>
      <xsl:otherwise>single</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:if test="$CUESSTYLEVERSION >= 60">
    <script>
      if(cuesDrawnShape==null)cuesDrawnShape=new icuesDrawnShape();
    </script>
  </xsl:if>
  <div class="cuesDrawersContainer" style="overflow:hidden">
    <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
    <xsl:attribute name="mode"><xsl:value-of select="$mode"/></xsl:attribute>
    <xsl:if test="$CUESSTYLEVERSION >= 60">
      <div id="cuesDrawersLayer" class="cuesDrawersLayer">&#160;</div>
    </xsl:if>    
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="cues:drawer">
<xsl:variable name="title">
  <xsl:call-template name="lookup">
    <xsl:with-param name="key" select="@title"/>
    <xsl:with-param name="keyed" select="@titleaskey"/>
    <xsl:with-param name="locale" select="../@setLocale"/>
  </xsl:call-template>
</xsl:variable>
  <div class="cuesDrawer">
    <xsl:attribute name="state">
      <xsl:choose>
        <xsl:when test="contains(@state,'open')">open</xsl:when>
        <xsl:otherwise>closed</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
    <xsl:attribute name="onClick">cuesClickDrawer(event,'<xsl:value-of select="@id"/>','<xsl:value-of select="../@id"/>');</xsl:attribute>
    <xsl:attribute name="onMouseOver">cuesMouseOverDrawer(event,'<xsl:value-of select="@id"/>');</xsl:attribute>
    <xsl:attribute name="onMouseOut">cuesMouseOutDrawer(event,'<xsl:value-of select="@id"/>');</xsl:attribute>
    <xsl:attribute name="title"><xsl:value-of select="$title"/></xsl:attribute>
    <nobr>
    <xsl:choose>
      <xsl:when test="@onclick and not(@hasitems='true')">
        <img border="0" class="cuesDrawerNonToggler" alt="">
          <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/spacer.gif</xsl:attribute>
        </img>
        <xsl:choose>
          <xsl:when test="$ISIE='1'">
            <a class="cuesDrawerLink">
              <xsl:attribute name="href">javascript:cuesInvokeChildlessDrawerURL('<xsl:value-of select="@id"/>','<xsl:value-of select="@onclick"/>','<xsl:value-of select="@target"/>','<xsl:value-of select="../@id"/>')</xsl:attribute>
              <xsl:call-template name="starttag"/>
              <xsl:text>span</xsl:text>
              <xsl:text disable-output-escaping="yes"> class=&apos;cuesDrawerVerticalAlign&apos;</xsl:text>
              <xsl:call-template name="endtag"/>
              <xsl:call-template name="starttag"/>
              <xsl:text>/span</xsl:text>
              <xsl:call-template name="endtag"/>
              <xsl:if test="@icon">
                <img border="0" width="16" height="16" class="cuesDrawerIcon" alt="">
                  <xsl:attribute name="src"><xsl:value-of select="@icon"/></xsl:attribute>
                </img>
              </xsl:if>
              <xsl:value-of select="$title"/>
            </a>
          </xsl:when>
          <xsl:otherwise>
            <a class="cuesDrawerLink" onclick="cuesStopEventBubble(event)">
              <xsl:attribute name="href">javascript:cuesInvokeChildlessDrawerURL('<xsl:value-of select="@id"/>','<xsl:value-of select="@onclick"/>','<xsl:value-of select="@target"/>','<xsl:value-of select="../@id"/>')</xsl:attribute>
              <xsl:if test="@icon">
                <img border="0" width="16" height="16" class="cuesDrawerIcon" alt="">
                  <xsl:attribute name="src"><xsl:value-of select="@icon"/></xsl:attribute>
                </img>
              </xsl:if>
              <xsl:value-of select="$title"/>
            </a>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <a class="cuesDrawerToggler">
          <xsl:attribute name="href">javascript:cuesToggleDrawer('<xsl:value-of select="@id"/>','<xsl:value-of select="../@id"/>')</xsl:attribute>
          <xsl:if test="$ISIE='1'">
            <xsl:call-template name="starttag"/>
            <xsl:text>span</xsl:text>
            <xsl:text disable-output-escaping="yes"> class=&apos;cuesDrawerVerticalAlign&apos;</xsl:text>
            <xsl:call-template name="endtag"/>
            <xsl:call-template name="starttag"/>
            <xsl:text>/span</xsl:text>
            <xsl:call-template name="endtag"/>
          </xsl:if>
          <img border="0">
            <xsl:choose>
              <xsl:when test="contains(@state,'open')">
                <xsl:attribute name="src">
                  <xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/drawerTriangleOpen</xsl:text><xsl:if test="$CUESSTYLEVERSION >= 60">T</xsl:if><xsl:text>.gif</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="alt">
                  <xsl:value-of select="$collapsedrawer"/>
                </xsl:attribute>
              </xsl:when>
              <xsl:otherwise>
                <xsl:attribute name="src">
                  <xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/drawerTriangleCollapsed</xsl:text><xsl:if test="$CUESSTYLEVERSION >= 60">T</xsl:if><xsl:text>.gif</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="alt">
                  <xsl:value-of select="$expanddrawer"/>
                </xsl:attribute>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:attribute name="id"><xsl:value-of select="@id"/>Toggler</xsl:attribute>
          </img>
        </a>

        <a class="cuesDrawerLink">
        
          <xsl:choose>
            <xsl:when test="@onclick">
              <xsl:attribute name="href">javascript:cuesInvokeChildlessDrawerURL('<xsl:value-of select="@id"/>','<xsl:value-of select="@onclick"/>','<xsl:value-of select="@target"/>','<xsl:value-of select="../@id"/>')</xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
              <xsl:attribute name="href">javascript:cuesInvokeDrawerDefaultItem('<xsl:value-of select="@id"/>','<xsl:value-of select="../@id"/>')</xsl:attribute>
            </xsl:otherwise>
          </xsl:choose>
        
          <xsl:if test="@icon">
            <img border="0" width="16" height="16" class="cuesDrawerIcon" alt="">
              <xsl:attribute name="src"><xsl:value-of select="@icon"/></xsl:attribute>
            </img>
          </xsl:if>
          <xsl:value-of select="$title"/>
        </a>

      </xsl:otherwise>
    </xsl:choose>
    </nobr>
  </div> 

  <xsl:if test="$CUESSTYLEVERSION >= 60">
    <script><xsl:text>cuesDrawnShape.makeDrawer('</xsl:text><xsl:value-of select="@id"/><xsl:text>');</xsl:text></script>
  </xsl:if>

  <xsl:if test="not(@onclick) or @hasitems='true'">
    <div class="cuesDrawerContent">
      <xsl:attribute name="style"><xsl:text>width:100%;</xsl:text>
        <xsl:choose>
          <xsl:when test="contains(@state,'open')">height:160px;</xsl:when>
          <xsl:otherwise>display:none;height:0px;</xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <xsl:attribute name="id"><xsl:value-of select="@id"/>Content</xsl:attribute>
      
      <xsl:if test="$CUESSTYLEVERSION >= 60 and ../@mode='single'">
        <xsl:attribute name="onclick">
          <xsl:text>setTimeout('cuesTileDrawers(&amp;quot;</xsl:text>
          <xsl:value-of select="../@id"/>
          <xsl:text>&amp;quot;)',50)</xsl:text>
        </xsl:attribute>
      </xsl:if>
      
      <div onkeydown="return icuesBaseTree.handleKeypress(event,this)">
        <xsl:attribute name="id">
          <xsl:value-of select="@id"/><xsl:text>NavTree.content</xsl:text>
        </xsl:attribute>
        <xsl:text> </xsl:text>
      </div>
      <xml>
        <xsl:attribute name="id">
          <xsl:value-of select="@id"/><xsl:text>NavTree</xsl:text>
        </xsl:attribute>
        <tree xmlns="">
          <xsl:apply-templates>
            <xsl:with-param name="drawerid" select="@id"/>
            <xsl:with-param name="previous"><xsl:value-of select="count(preceding::cues:draweritem)"/></xsl:with-param>
          </xsl:apply-templates>
        </tree>
      </xml>
      <script>        
        <xsl:text>try{new icuesTree('</xsl:text>
        <xsl:value-of select="@id"/>
        <xsl:text>NavTree','never',false,'navigation').buildTree();}catch(e){}</xsl:text>
      </script>

    </div> 
    <xsl:apply-templates select=".//cues:draweritem[@default='true']" mode="defaultdraweritem">
      <xsl:with-param name="drawerid" select="@id"/>
    </xsl:apply-templates>
  </xsl:if>
</xsl:template>

<xsl:template match="cues:draweritem">
  <xsl:param name="drawerid">mockupTree</xsl:param>  
  <xsl:param name="previous">0</xsl:param>    
  <xsl:variable name="pre"><xsl:value-of select="count(preceding::cues:draweritem)"/></xsl:variable>
  <xsl:variable name="anc"><xsl:value-of select="count(ancestor::cues:draweritem)"/></xsl:variable>
  <xsl:variable name="itemid">
    <xsl:value-of select="$drawerid"/>_<xsl:value-of select="$pre + $anc - $previous"/>
  </xsl:variable>
  
  <node leaf="auto" state="closed">
    <xsl:attribute name="id">
      <xsl:value-of select="$itemid"/>
    </xsl:attribute>

    <xsl:if test="@contextmenu='true'">
      <xsl:attribute name="contextmenu">
        <xsl:text>return icuesDrawerItemOncontextmenu(event,'</xsl:text>
        <xsl:value-of select="$drawerid"/>
        <xsl:text>','</xsl:text>
        <xsl:value-of select="$itemid"/>
        <xsl:text>')</xsl:text>
      </xsl:attribute>
    </xsl:if>

    <xsl:attribute name="label">
      <xsl:call-template name="lookup">
        <xsl:with-param name="key" select="@text"/>
        <xsl:with-param name="keyed" select="@textaskey"/>
        <xsl:with-param name="locale" select="../../@setLocale"/>
      </xsl:call-template>
    </xsl:attribute>

    <xsl:if test="@target">
      <xsl:attribute name="target">
        <xsl:value-of select="@target"/>
      </xsl:attribute>
    </xsl:if>

    <xsl:if test="@onclick">
      <xsl:attribute name="onclick">
        <xsl:call-template name="escapeOnclick">
          <xsl:with-param name="stringIn" select="@onclick"/>
        </xsl:call-template>
      </xsl:attribute>
    </xsl:if>

    <xsl:if test="@tooltip">
      <xsl:attribute name="tooltip">
        <xsl:call-template name="escapeAsXML">
          <xsl:with-param name="stringIn" select="@tooltip"/>
        </xsl:call-template>
      </xsl:attribute>
    </xsl:if>

    <xsl:if test="@icon">
      <xsl:attribute name="icon">
        <xsl:value-of select="@icon"/>
      </xsl:attribute>
    </xsl:if>

    <xsl:if test="@appdata">
      <xsl:attribute name="appdata">
        <xsl:call-template name="escapeAsXML">
          <xsl:with-param name="stringIn" select="@appdata"/>
        </xsl:call-template>
      </xsl:attribute>
    </xsl:if>
  
    <xsl:apply-templates>
      <xsl:with-param name="drawerid" select="$drawerid"/>
      <xsl:with-param name="previous" select="$previous"/>
    </xsl:apply-templates>
  <xsl:text> </xsl:text>
  </node>

</xsl:template>

<xsl:template match="cues:draweritem" mode="defaultdraweritem">
  <xsl:param name="drawerid"/>
  <xsl:param name="previous">0</xsl:param>    
  <xsl:variable name="pre"><xsl:value-of select="count(preceding::cues:draweritem)"/></xsl:variable>
  <xsl:variable name="anc"><xsl:value-of select="count(ancestor::cues:draweritem)"/></xsl:variable>
  <xsl:variable name="itemid">
    <xsl:value-of select="$drawerid"/>_<xsl:value-of select="$pre + $anc - $previous"/>
  </xsl:variable>
  <script>
    <xsl:text>drawerDefaultItemURL['</xsl:text><xsl:value-of select="$drawerid"/><xsl:text>']="</xsl:text><xsl:value-of select="@onclick"/><xsl:text>";</xsl:text>
    <xsl:text>drawerDefaultItemTarget['</xsl:text><xsl:value-of select="$drawerid"/><xsl:text>']="</xsl:text><xsl:value-of select="@target"/><xsl:text>";</xsl:text>
    <xsl:text>drawerDefaultItemId['</xsl:text><xsl:value-of select="$drawerid"/><xsl:text>']="</xsl:text><xsl:value-of select="$itemid"/><xsl:text>";</xsl:text>
  </script>
</xsl:template>

<xsl:template match="cues:fielderr">
  <div>
    <xsl:attribute name="class">
      <xsl:text>cuesErrorText</xsl:text>
      <xsl:if test="$CUESSTYLEVERSION >= 60 and @location='beside'">
        <xsl:text>Inline</xsl:text>
        <xsl:if test="@float='true' and $RTL='1'">
          <xsl:text>FloatRight</xsl:text>
        </xsl:if>
        <xsl:if test="@float='true' and $RTL='0'">
          <xsl:text>FloatLeft</xsl:text>
        </xsl:if>
      </xsl:if>
    </xsl:attribute>
    <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>_err</xsl:text></xsl:attribute>
    <xsl:if test="@visible='false'">
      <xsl:attribute name="style"><xsl:text>display:none</xsl:text></xsl:attribute>
    </xsl:if>
    <xsl:if test="not(@visible)">
      <xsl:attribute name="style"><xsl:text>display:none</xsl:text></xsl:attribute>
    </xsl:if>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="cues:filteredlistbox">
  <xsl:variable name="ajaxurl">
    <xsl:choose>
      <xsl:when test="@ajaxurl"><xsl:value-of select="@ajaxurl"/></xsl:when>
      <xsl:otherwise><xsl:text/></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="find">
    <xsl:choose>
      <xsl:when test="@value"><xsl:value-of select="@value"/></xsl:when>
      <xsl:otherwise><xsl:text/></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <select 
        onkeypress="return cuesOnkeypressFilteredListboxHandler(this,event)"
        onkeydown="return cuesOnkeydownFilteredListboxHandler(this,event)"
        onfocus="return cuesOnfocusFilteredListboxHandler(this,event)"
        onblur="return cuesOnblurFilteredListboxHandler(this,event)">
    <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
    <xsl:if test="@name">
      <xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute>
    </xsl:if>
    <xsl:if test="@width">
      <xsl:attribute name="style"><xsl:text>width:</xsl:text><xsl:value-of select="@width"/></xsl:attribute>
    </xsl:if>
    <xsl:attribute name="ajaxurl"><xsl:value-of select="$ajaxurl"/></xsl:attribute>
    <xsl:attribute name="find"><xsl:value-of select="$find"/></xsl:attribute>
    <option/>
  </select>
  <xml style="display:none">
    <xsl:attribute name="id"><xsl:value-of select="@id"/>_choices</xsl:attribute>
    <choices>
      <xsl:apply-templates/>
    </choices>
  </xml>
  <script><xsl:text>cuesFilteredListboxInit("</xsl:text><xsl:value-of select="@id"/><xsl:text>");</xsl:text></script>
</xsl:template>

<xsl:template match="cues:formpane">
  <div class="cuesFormPane">
    <xsl:if test="@id">
      <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
    </xsl:if>
    <xsl:if test="$ISIE='1'">
      <xsl:attribute name="class">cuesFormPane cuesFormPaneIE</xsl:attribute>
    </xsl:if>
    <div class="cuesFormPaneLayer">
      <xsl:text>&#160;</xsl:text>
    </div>
    <div class="cuesFormPaneContainer">
      <xsl:if test="@id">
        <xsl:attribute name="id"><xsl:value-of select="@id"/>.container</xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
    </div>
  </div>
</xsl:template>

<xsl:template match="cues:gettingstarted">
<xsl:variable name="title">
  <xsl:choose>
    <xsl:when test="@title">
      <xsl:call-template name="lookup">
        <xsl:with-param name="key" select="@title"/>
        <xsl:with-param name="keyed" select="@titleaskey"/>
        <xsl:with-param name="locale" select="@setLocale"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$gettingstarted"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>
  <center>
    <div class="cuesGettingStartedContainer">
      <div class="cuesGettingStartedLayer">&#160;</div>
      <div class="cuesGettingStartedCaption">
        <span>
          <xsl:value-of select="$title"/>
        </span>
      </div>
      <xsl:apply-templates/>
    </div>
  </center>
</xsl:template>
<xsl:template match="cues:gettingstartedbody">
  <div class="cuesGettingStartedBody">
    <table>
      <tr>
        <td width="50%" valign="top">
          <xsl:if test="$CUESSTYLEVERSION &lt; 60">
            <xsl:attribute name="class">cuesGettingStartedSectionDivider</xsl:attribute>
          </xsl:if>
          <xsl:apply-templates/>
        </td>
      </tr>
    </table>
  </div>
</xsl:template>
<xsl:template match="cues:gettingstartedconfigure"> 
  <div class="cuesGettingStartedConfigure">
    <span>
      <input type="checkbox" alt="" title="">
        <xsl:attribute name="onclick"><xsl:value-of select="@onclick"/></xsl:attribute>
        <xsl:if test="@checked='true'">
          <xsl:attribute name="checked">true</xsl:attribute>
        </xsl:if>
      </input>
      <xsl:value-of select="$donotshowagain"/>
    </span>
  </div>
</xsl:template>
<xsl:template match="cues:gettingstartedfooter"> 
  <div class="cuesGettingStartedFooter">
    <span>
      <xsl:apply-templates/>
    </span>
  </div>
</xsl:template>
<xsl:template match="cues:gettingstartedheader"> 
  <div class="cuesGettingStartedHeader">
    <span class="cuesGettingStartedHeaderText">
      <xsl:apply-templates/>
    </span>
  </div>
</xsl:template>
<xsl:template match="cues:gettingstartedsection"> 
  <xsl:variable name="title">
    <xsl:call-template name="lookup">
      <xsl:with-param name="key" select="@title"/>
      <xsl:with-param name="keyed" select="@titleaskey"/>
      <xsl:with-param name="locale" select="@setLocale"/>
    </xsl:call-template>
  </xsl:variable>
  <div>
    <xsl:attribute name="class">
      <xsl:text>cuesGettingStartedSection</xsl:text>
      <xsl:if test="@lastincolumn='true'"><xsl:text>Last</xsl:text></xsl:if>
    </xsl:attribute>
    <div class="cuesGettingStartedSectionTitle">
      <img alt="" title="" onload="cuesFixPNG(null,this)">
        <xsl:attribute name="src"><xsl:value-of select="@icon"/></xsl:attribute>
      </img>
      <span>
        <xsl:value-of select="$title"/>
      </span>
    </div>
    <xsl:apply-templates/>
  </div>
</xsl:template>
<xsl:template match="cues:gettingstartedsectionitem[@onclick]"> 
  <div class="cuesGettingStartedSectionItem">
    <a>
      <xsl:attribute name="href"><xsl:value-of select="@onclick"/></xsl:attribute>
      <xsl:if test="@target">
        <xsl:attribute name="target"><xsl:value-of select="@target"/></xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
    </a>
    <xsl:if test="@external='true'">
      <xsl:text>&#160;</xsl:text>
      <img style="border:0">
        <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/new-window_link_icon.gif</xsl:text></xsl:attribute>
        <xsl:attribute name="alt"><xsl:value-of select="$newwindow"/></xsl:attribute>
        <xsl:attribute name="title"><xsl:value-of select="$newwindow"/></xsl:attribute>
      </img>
    </xsl:if>
  </div>
</xsl:template>
<xsl:template match="cues:gettingstartedsectionitem"> 
  <div class="cuesGettingStartedSectionItem">
    <xsl:apply-templates/>
  </div>
</xsl:template>
<xsl:template match="cues:gettingstartedsectiondivider"> 
  <xsl:call-template name="starttag"/><xsl:text>/td</xsl:text><xsl:call-template name="endtag"/>

  <xsl:if test="$CUESSTYLEVERSION >= 60">
    <xsl:call-template name="starttag"/><xsl:text>td width="10px" valign="top" class="cuesGettingStartedSectionDivider"</xsl:text><xsl:call-template name="endtag"/>
    <xsl:text>&#160;</xsl:text>
    <xsl:call-template name="starttag"/><xsl:text>/td</xsl:text><xsl:call-template name="endtag"/>
  </xsl:if>

  <xsl:call-template name="starttag"/><xsl:text>td valign="top"</xsl:text><xsl:call-template name="endtag"/>
</xsl:template>

<xsl:template match="cues:grid">
  <xsl:variable name="numcolumns">
    <xsl:choose>
      <xsl:when test="@pattern='1x2'">2</xsl:when>
      <xsl:when test="@pattern='2x2'">2</xsl:when>
      <xsl:when test="@pattern='1x3'">3</xsl:when>
      <xsl:when test="@pattern='2x3'">3</xsl:when>
      <xsl:otherwise>1</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="id">
    <xsl:choose>
      <xsl:when test="@id"><xsl:value-of select="@id"/></xsl:when>
      <xsl:otherwise>cuesGrid</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <table width="100%" border="0" cellspacing="8">
    <xsl:attribute name="id"><xsl:value-of select="$id"/></xsl:attribute>
    <tr>  
      <xsl:call-template name="gridcell">
        <xsl:with-param name="pos">1</xsl:with-param>
        <xsl:with-param name="col">0</xsl:with-param>
        <xsl:with-param name="numcolumns" select="$numcolumns"/>
        <xsl:with-param name="numcells" select="count(child::cues:gridcell)"/>
      </xsl:call-template>
    </tr>
  </table>
</xsl:template>
<xsl:template match="cues:gridcell">
  <xsl:apply-templates/>
</xsl:template>
<xsl:template name="gridcell">
  <xsl:param name="pos"/>
  <xsl:param name="col"/>
  <xsl:param name="numcolumns"/>
  <xsl:param name="numcells"/>
  <xsl:variable name="span">
    <xsl:choose>
      <xsl:when test="./cues:gridcell[position()=$pos]/@span"><xsl:value-of select="./cues:gridcell[position()=$pos]/@span"/></xsl:when>
      <xsl:otherwise>1</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="width"><xsl:value-of select="(100 div $numcolumns) * $span"/>%</xsl:variable>
  <xsl:if test="$col + $span > $numcolumns">
    <xsl:if test="$pos != 0"><xsl:call-template name="endtablerow"/></xsl:if>
    <xsl:call-template name="starttablerow"/>
  </xsl:if>
  <td valign="top">
    <xsl:if test="./cues:gridcell[position()=$pos]/@id"><xsl:attribute name="id"><xsl:value-of select="./cues:gridcell[position()=$pos]/@id"/></xsl:attribute></xsl:if>
    <xsl:attribute name="width"><xsl:value-of select="$width"/></xsl:attribute>
    <xsl:attribute name="colspan"><xsl:value-of select="$span"/></xsl:attribute>
    <xsl:apply-templates select="./cues:gridcell[position()=$pos]"/>
  </td>
  <xsl:if test="$numcells > $pos">
    <xsl:call-template name="gridcell">
      <xsl:with-param name="pos"><xsl:value-of select="$pos+1"/></xsl:with-param>
      <xsl:with-param name="col">
        <xsl:choose>
          <xsl:when test="$col + $span > $numcolumns">0</xsl:when>
          <xsl:otherwise><xsl:value-of select="$col+$span"/></xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
      <xsl:with-param name="numcolumns" select="$numcolumns"/>
      <xsl:with-param name="numcells" select="$numcells"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

<xsl:template match="cues:groupbox">
  <fieldset>
    <xsl:if test="@id">
      <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
    </xsl:if>
    <xsl:if test="@width">
      <xsl:if test="$ISIE='1'">
        <xsl:attribute name="style"><xsl:text>width:</xsl:text><xsl:value-of select="@width"/></xsl:attribute>
      </xsl:if>
      <xsl:if test="$ISIE='0' and @width != '0'">
        <xsl:attribute name="style"><xsl:text>width:</xsl:text><xsl:value-of select="@width"/></xsl:attribute>
      </xsl:if>
    </xsl:if>
    <xsl:if test="@accesskey">
      <xsl:attribute name="accesskey"><xsl:value-of select="@accesskey"/></xsl:attribute>
    </xsl:if>
    <xsl:attribute name="class">
      <xsl:text>cuesGroupBox</xsl:text>
      <xsl:if test="@indented='true'"><xsl:text>Indented</xsl:text></xsl:if>
    </xsl:attribute>
    <xsl:if test="@title">
      <legend class="cuesGroupBoxTitle">
        <xsl:call-template name="lookup">
          <xsl:with-param name="key" select="@title"/>
          <xsl:with-param name="keyed" select="@titleaskey"/>
          <xsl:with-param name="locale" select="@setLocale"/>
        </xsl:call-template>
      </legend>
    </xsl:if>
    <xsl:apply-templates/>
  </fieldset>
</xsl:template>

<xsl:template match="cues:hideshowcontroller">
  <xsl:variable name="state">
    <xsl:choose>        
      <xsl:when test="@state = 'shown'">shown</xsl:when>
      <xsl:otherwise>hidden</xsl:otherwise>
    </xsl:choose>        
  </xsl:variable>
  <a class="cuesHideShow" onclick="cuesSetInsideAction(true)">
    <xsl:attribute name="state"><xsl:value-of select="$state"/></xsl:attribute>
    <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
    <xsl:attribute name="href"><xsl:text>javascript:cuesToggleHideShow('</xsl:text><xsl:value-of select="@id"/><xsl:text>')</xsl:text></xsl:attribute>
    <xsl:choose>        
      <xsl:when test="$state = 'hidden'">
        <img border="0" width="15" height="27" class="cuesHideShowIcon" alt="Expand" title="Expand">
          <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>Toggler</xsl:text></xsl:attribute>
          <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/drawerTriangleCollapsed.gif</xsl:attribute>
        </img>
      </xsl:when>
      <xsl:otherwise>
        <img border="0" width="15" height="27" class="cuesHideShowIcon" alt="Collapse" title="Collapse">
          <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>Toggler</xsl:text></xsl:attribute>
          <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/drawerTriangleOpen.gif</xsl:attribute>
        </img>
      </xsl:otherwise>
    </xsl:choose>        
    <xsl:call-template name="lookup">
      <xsl:with-param name="key" select="@title"/>
      <xsl:with-param name="keyed" select="@titleaskey"/>
      <xsl:with-param name="locale" select="@setLocale"/>
    </xsl:call-template>
  </a>
</xsl:template>
<xsl:template match="cues:hideshowpane[@state='shown']">
  <div>
    <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>.Content</xsl:text></xsl:attribute>
    <xsl:apply-templates/>
  </div>
</xsl:template>
<xsl:template match="cues:hideshowpane">
  <div style="display:none;">
    <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>.Content</xsl:text></xsl:attribute>
    <xsl:apply-templates/>
  </div>
</xsl:template>
<xsl:template match="cues:more">
  <xsl:variable name="state">
    <xsl:choose>        
      <xsl:when test="@state = 'expanded'">expanded</xsl:when>
      <xsl:otherwise>collapsed</xsl:otherwise>
    </xsl:choose>        
  </xsl:variable>
  <div style="display:none">
    <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>.MoreLink</xsl:text></xsl:attribute>
    <xsl:text>...&lt;</xsl:text>
    <a>
      <xsl:attribute name="href"><xsl:text>javascript:cuesShowMore('</xsl:text><xsl:value-of select="@id"/><xsl:text>')</xsl:text></xsl:attribute>
      <xsl:text>more</xsl:text>
    </a>
    <xsl:text>&gt;</xsl:text>
  </div>
  <div>
    <xsl:attribute name="style">
      <xsl:if test="$state = 'expanded'">display:none;</xsl:if>
      <xsl:if test="$state = 'collapsed'">display:inline;</xsl:if>
    </xsl:attribute>
    <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>.More</xsl:text></xsl:attribute>
    <xsl:text>...&lt;</xsl:text>
    <a>
      <xsl:attribute name="href"><xsl:text>javascript:cuesShowMore('</xsl:text><xsl:value-of select="@id"/><xsl:text>')</xsl:text></xsl:attribute>
      <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>.MoreAction</xsl:text></xsl:attribute>
      <xsl:text>more</xsl:text>
    </a>
    <xsl:text>&gt;</xsl:text>
  </div>
  <div>
    <xsl:attribute name="style">
      <xsl:if test="$state = 'expanded'">display:inline;</xsl:if>
      <xsl:if test="$state = 'collapsed'">display:none;</xsl:if>
    </xsl:attribute>
    <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>.Less</xsl:text></xsl:attribute>          
    <xsl:apply-templates/>
    <xsl:text>&#160;&lt;</xsl:text>
    <a>
      <xsl:attribute name="href"><xsl:text>javascript:cuesShowLess('</xsl:text><xsl:value-of select="@id"/><xsl:text>')</xsl:text></xsl:attribute>
      <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>.LessAction</xsl:text></xsl:attribute>
      <xsl:text>less</xsl:text>
    </a>
    <xsl:text>&gt;</xsl:text>
  </div>
</xsl:template>

<xsl:template match="cues:hr[@label]">
  <br/>
  <table width="100%">
    <tr>
      <td class="cuesHRLabel">
        <nobr>
          <xsl:value-of select="@label"/>
          <xsl:text>&#160;</xsl:text>
        </nobr>
      </td>
      <td width="100%">
        <hr class="cuesHR"/>
      </td>
    </tr>
  </table>
  <br/>
</xsl:template>
<xsl:template match="cues:hr">
  <hr class="cuesHR">
    <xsl:if test="@width">
      <xsl:attribute name="width"><xsl:value-of select="@width"/></xsl:attribute>
    </xsl:if>
  </hr>
</xsl:template>

<xsl:template match="cues:layout"> 
  <script>
    <xsl:text>cuesLoadScript("</xsl:text><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_utility/cues_taglib_layout.js");</xsl:text>
  </script>
  <xsl:apply-templates select="cues:layoutnavtabs"/>

  <table style="table-layout:fixed;height:100%;width:100%;" cellPadding="0" cellSpacing="0" id="cuesLayout" border="0">
    <xsl:if test="$CUESSTYLEVERSION &lt; 60">
      <xsl:attribute name="rules">cols</xsl:attribute>
    </xsl:if>
    <tr>
      <xsl:if test="$CUESSTYLEVERSION >= 60">
        <td id="cuesLayoutLeftBorder">&#160;</td>
      </xsl:if>
      <xsl:apply-templates select="cues:layoutnav"/>
      <xsl:apply-templates select="cues:layoutcontent"/>      
      <xsl:apply-templates select="cues:layouttaskpanel"/>
      <xsl:if test="$CUESSTYLEVERSION >= 60">
        <td id="cuesLayoutRightBorder">&#160;</td>
      </xsl:if>
    </tr>
  </table>
  <xsl:if test="$CUESSTYLEVERSION >= 60">
    <xsl:apply-templates select="cues:layoutcopyright"/>
  </xsl:if>
</xsl:template>
<xsl:template match="cues:layoutcopyright"> 
  <div id="cuesLayoutCopyright" class="cuesLayoutCopyright">
    <xsl:apply-templates/>
  </div>
</xsl:template>
<xsl:template match="cues:layoutnavtabs"> 
  <table style="table-layout:fixed" cellPadding="0" cellSpacing="0" border="0" width="100%">
    <tr>
      <td id="cuesLayoutLeftBorder">&#160;</td>
      <td id="cuesLayoutNavTabs" valign="top">
        <xsl:apply-templates/>
      </td>
      <td id="cuesLayoutRightBorder">&#160;</td>
    </tr>
  </table>
</xsl:template>
<xsl:template match="cues:layoutnav"> 
  <xsl:variable name="resizable">
    <xsl:choose>
      <xsl:when test="$CUESSTYLEVERSION >= 60">true</xsl:when>
      <xsl:when test="@resizable"><xsl:value-of select="@resizable"/></xsl:when>
      <xsl:otherwise>false</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <td class="cuesLayoutNavArea" valign="top">
    <xsl:attribute name="width"><xsl:value-of select="@width"/></xsl:attribute>
    <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
    <xsl:choose>
      <xsl:when test="$CUESSTYLEVERSION >= 60">
         <div id="cuesLayoutNavContainer" class="cuesLayoutNavContainer">
           <div id="cuesLayoutNavLayer" class="cuesLayoutNavLayer">&#160;</div>
           <xsl:apply-templates/>
         </div>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
  </td>
  <td id="cuesLayoutTogglerArea" width="4px">
    <xsl:if test="$resizable='true'">
      <xsl:attribute name="onmousedown"><xsl:text>return icuesResizeLayerMouseDown(event,this)</xsl:text></xsl:attribute>
    </xsl:if>
    <xsl:if test="$resizable='true'">
      <div id="cuesResizeLayer"><div id="cuesResizeBox">&#160;</div>&#160;</div>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="$resizable='true'">
        <img id="cuesNavGripper" 
             onmouseover="cuesMouseOverGripper(event,this)"
             onmouseout="cuesMouseOutGripper(event,this)">
          <xsl:attribute name="title"><xsl:value-of select="$resizenav"/></xsl:attribute>
          <xsl:attribute name="alt"><xsl:value-of select="$resizenav"/></xsl:attribute>
          <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/NavPaneGripperT_V.gif</xsl:text></xsl:attribute>
        </img>
      </xsl:when>
      <xsl:otherwise>
        <img id="cuesToggler" onclick="cuesToggleNavArea(event,this)"
             onmouseover="cuesMouseOverToggler(event,this)"
             onmouseout="cuesMouseOutToggler(event,this)"
             state="open">
          <xsl:attribute name="title"><xsl:value-of select="$collapsenav"/></xsl:attribute>
          <xsl:attribute name="alt"><xsl:value-of select="$collapsenav"/></xsl:attribute>
          <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/split-opened-html.gif</xsl:text></xsl:attribute>
        </img>
      </xsl:otherwise>
    </xsl:choose>
  </td>
</xsl:template>
<xsl:template match="cues:layoutcontent"> 
  <td id="cuesLayoutContentArea" width="*" valign="top">
    <div width="100%" height="100%">
      <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
      <xsl:attribute name="style">
        <xsl:text>position:relative;overflow:</xsl:text>
        <xsl:choose>
          <xsl:when test="@scrollable='false'">hidden</xsl:when>
          <xsl:otherwise>auto</xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <xsl:if test="$CUESSTYLEVERSION >= 60">
        <div id="icuesContentLayer" class="cuesLayoutContentLayer">&#160;</div>
      </xsl:if>
      <xsl:apply-templates/>
    </div>
  </td>
</xsl:template>
<xsl:template match="cues:layouttaskpanel"> 
  <xsl:if test="$CUESSTYLEVERSION >= 61">
    <td onmousedown="return icuesResizeLayerMouseDown(event,this)" 
        id="cuesLayoutTaskPanelResizer" width="4px" style="display:none;">
      <img id="cuesTaskPanelGripper" 
           onmouseover="cuesMouseOverGripper(event,this)"
           onmouseout="cuesMouseOutGripper(event,this)">
        <xsl:attribute name="title"><xsl:value-of select="$resizetaskpane"/></xsl:attribute>
        <xsl:attribute name="alt"><xsl:value-of select="$resizetaskpane"/></xsl:attribute>
        <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/NavPaneGripperT_V.gif</xsl:text></xsl:attribute>
      </img>
    </td>
  </xsl:if>
  <td id="cuesLayoutTaskPanelArea" style="display:none" width="1" valign="top">
    <xsl:choose>
      <xsl:when test="$CUESSTYLEVERSION >= 61">
        <div id="cuesLayoutTaskPanelContainer">
          <div class="cuesLayoutTaskPanelLayer">&#160;</div>
        </div>
      </xsl:when>
      <xsl:otherwise>&#160;</xsl:otherwise>
    </xsl:choose>
  &#160;
  </td>
</xsl:template>

<xsl:template match="cues:localize"> 
  <xsl:call-template name="lookup">
    <xsl:with-param name="key" select="@key"/>
    <xsl:with-param name="keyed">true</xsl:with-param>
    <xsl:with-param name="locale" select="@setLocale"/>
  </xsl:call-template>
</xsl:template>

<xsl:template name="login62">
  <table class="cuesLoginContainer" border="0" cellpadding="0" cellspacing="0">
    <tr height="100%">
      <td valign="top">
        <div id="cuesLoginProductSection" class="cuesLoginProductSection"><br class="cuesLoginClear" />
          <table>            
            <tr>
              <td valign="top" style="padding-bottom:5px">
                <img onload="cuesFixPNG(null,this)" align="absmiddle">
                  <xsl:attribute name="class">
                    <xsl:text>cuesLoginLogo</xsl:text>
                    <xsl:if test="$RTL='1'">RTL</xsl:if>
                  </xsl:attribute>
                  <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/<xsl:value-of select="$CUESHEADERIMAGE"/></xsl:attribute>
                  <xsl:attribute name="title"><xsl:value-of select="$companylogo"/></xsl:attribute>
                  <xsl:attribute name="alt"><xsl:value-of select="$companylogo"/></xsl:attribute>
                </img>
              </td>
              <td valign="top">
                <xsl:apply-templates select="cues:loginproductfamily"/>
                <xsl:apply-templates select="cues:loginproduct"/>
                <xsl:apply-templates select="cues:loginproductsubtitle"/>
                <xsl:apply-templates select="cues:loginversion"/>
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <br/>
                <xsl:apply-templates select="cues:loginstatus"/>
              </td>
            </tr>
          </table>
        </div>
      </td>
      <td valign="top">
        <div id="cuesLoginFieldsSection" class="cuesLoginFieldsSection"><br class="cuesLoginClear" />
          <table width="10px">
            <tr>
              <td><xsl:text>&#160;</xsl:text></td>
              <td>
                <xsl:apply-templates select="cues:loginerror"/>
              </td>
            </tr>
            <xsl:apply-templates select="cues:loginfield"/>
            <tr>
              <td colspan="2" class="cuesBrSmall">&#160;</td>
            </tr>
            <tr>
              <td>&#160;</td>
              <td nowrap="yes">
                <button id="cuesLoginSubmitButton" type="submit" class="cuesLoginButton">
                  <xsl:choose>
                    <xsl:when test="@usealttext='true'"><xsl:value-of select="$signin"/></xsl:when>
                    <xsl:otherwise><xsl:value-of select="$login"/></xsl:otherwise>
                  </xsl:choose>
                </button>
                <xsl:if test="@reset">
                  <xsl:text>&#160;&#160;</xsl:text>
                  <button id="cuesLoginResetButton" type="reset" class="cuesLoginButton" onclick="cuesResetFormFocus(this)"><xsl:value-of select="$reset"/></button>
                </xsl:if>
                <img id="cuesLoginProgress" style="visibility:hidden;" alt="" title=""> 
                  <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/login_progress.gif</xsl:attribute>
                </img>
              </td>
            </tr>
            <xsl:if test="@problemlink">
              <tr>
                <td>&#160;</td>
                <td>
                  <a class="cuesLoginProblemLink">
                    <xsl:attribute name="href"><xsl:value-of select="@problemlink"/></xsl:attribute>
                    <xsl:value-of select="$loginproblem"/>
                  </a>
                </td>
              </tr>
            </xsl:if>            
            <tr>
              <td>&#160;</td>
              <td>
                <xsl:apply-templates select="cues:loginlink"/>
              </td>
            </tr>
          </table>
        </div>
      </td>
    </tr>
    <tr>
      <td valign="bottom" colspan="2">
        <div id="cuesLoginInfoSection" class="cuesLoginInfoSection"><br class="cuesLoginClear" />
          <xsl:apply-templates select="cues:logincopyright"/>
        </div>
      </td>
    </tr>
  </table>
  <script>
    if (document.addEventListener)
      window.addEventListener('resize', icuesLoginLayout, false);
    else if (document.attachEvent)
      window.attachEvent('onresize', icuesLoginLayout);
    icuesLoginLayout();  
  </script>
</xsl:template>
<xsl:template name="login60">
  <table class="cuesLoginContainer" border="0" cellpadding="0" cellspacing="0">
    <tr height="100%">
      <td valign="top">
        <div id="cuesLoginProductSection" class="cuesLoginProductSection"><br class="cuesLoginClear" />
          <table>            
            <xsl:choose>
              <xsl:when test="cues:loginproductfamily">
                <tr>
                  <td valign="bottom" style="padding-bottom:5px">
                    <img onload="cuesFixPNG(null,this)" class="cuesLoginLogo" align="absmiddle">
                      <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/<xsl:value-of select="$CUESHEADERIMAGE"/></xsl:attribute>
                      <xsl:attribute name="title"><xsl:value-of select="$companylogo"/></xsl:attribute>
                      <xsl:attribute name="alt"><xsl:value-of select="$companylogo"/></xsl:attribute>
                    </img>
                  </td>
                  <td valign="bottom">
                    <xsl:apply-templates select="cues:loginproductfamily"/>
                    <xsl:apply-templates select="cues:loginproduct"/>
                  </td>
                </tr>
                <tr>
                  <td>&#160;</td>
                  <td>
                    <xsl:apply-templates select="cues:loginproductsubtitle"/>
                    <br/>
                    <xsl:apply-templates select="cues:loginversion"/>
                  </td>
                </tr>
              </xsl:when>
              <xsl:otherwise>
                <tr>
                  <td valign="bottom" style="padding-bottom:5px">
                    <img onload="cuesFixPNG(null,this)" class="cuesLoginLogo" align="absmiddle">
                      <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/<xsl:value-of select="$CUESHEADERIMAGE"/></xsl:attribute>
                      <xsl:attribute name="title"><xsl:value-of select="$companylogo"/></xsl:attribute>
                      <xsl:attribute name="alt"><xsl:value-of select="$companylogo"/></xsl:attribute>
                    </img>
                  </td>
                  <td valign="bottom">
                    <xsl:apply-templates select="cues:loginproduct"/>
                    <xsl:apply-templates select="cues:loginproductsubtitle"/>
                  </td>
                </tr>
                <tr>
                  <td>&#160;</td>
                  <td>
                    <br/>
                    <xsl:apply-templates select="cues:loginversion"/>
                  </td>
                </tr>
              </xsl:otherwise>
            </xsl:choose>
            <tr>
              <td colspan="2">
                <br/>
                <xsl:apply-templates select="cues:loginstatus"/>
              </td>
            </tr>
          </table>
        </div>
      </td>
      <td valign="top">
        <div id="cuesLoginFieldsSection" class="cuesLoginFieldsSection"><br class="cuesLoginClear" />
          <table width="10px">
            <tr>
              <td><xsl:text>&#160;</xsl:text></td>
              <td>
                <xsl:apply-templates select="cues:loginerror"/>
              </td>
            </tr>
            <xsl:apply-templates select="cues:loginfield"/>
            <tr>
              <td colspan="2" class="cuesBrSmall">&#160;</td>
            </tr>
            <tr>
              <td>&#160;</td>
              <td nowrap="yes">
                <button id="cuesLoginSubmitButton" type="submit" class="cuesLoginButton">
                  <xsl:choose>
                    <xsl:when test="@usealttext='true'"><xsl:value-of select="$signin"/></xsl:when>
                    <xsl:otherwise><xsl:value-of select="$login"/></xsl:otherwise>
                  </xsl:choose>
                </button>
                <xsl:if test="@reset">
                  <xsl:text>&#160;&#160;</xsl:text>
                  <button id="cuesLoginResetButton" type="reset" class="cuesLoginButton" onclick="cuesResetFormFocus(this)"><xsl:value-of select="$reset"/></button>
                </xsl:if>
                <img id="cuesLoginProgress" style="visibility:hidden;" alt="" title=""> 
                  <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/login_progress.gif</xsl:attribute>
                </img>
              </td>
            </tr>
            <xsl:if test="@problemlink">
              <tr>
                <td>&#160;</td>
                <td>
                  <a class="cuesLoginProblemLink">
                    <xsl:attribute name="href"><xsl:value-of select="@problemlink"/></xsl:attribute>
                    <xsl:value-of select="$loginproblem"/>
                  </a>
                </td>
              </tr>
            </xsl:if>
            
            <tr>
              <td>&#160;</td>
              <td>
                <xsl:apply-templates select="cues:loginlink"/>
              </td>
            </tr>
          </table>
        </div>
      </td>
    </tr>
    <tr>
      <td valign="bottom" colspan="2">
        <div id="cuesLoginInfoSection" class="cuesLoginInfoSection"><br class="cuesLoginClear" />
          <xsl:apply-templates select="cues:logincopyright"/>
        </div>
      </td>
    </tr>
  </table>
  <script>
    if (document.addEventListener)
      window.addEventListener('resize', icuesLoginLayout, false);
    else if (document.attachEvent)
      window.attachEvent('onresize', icuesLoginLayout);
    icuesLoginLayout();  
  </script>
</xsl:template>
<xsl:template name="login5x">
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td class="cuesLoginMainLeft" style="padding-left:18px" width="100%">
        <xsl:apply-templates select="cues:loginproduct"/>
        <br/>
        <xsl:apply-templates select="cues:loginversion"/>
      </td>
      <td class="cuesLoginMainLeft" align="right" style="padding-left:64px;padding-right:18px;padding-top:18px;padding-bottom:18px;">
        <table>
          <xsl:apply-templates select="cues:loginfield"/>
          <tr>
            <td colspan="2" class="cuesLoginGap">&#160;</td>
          </tr>
          <tr>
            <td>&#160;</td>
            <td class="cuesLoginMainLeft" align="right">
              <button id="cuesLoginSubmitButton" type="submit" class="cuesLoginButton"><xsl:value-of select="$login"/></button>
              <xsl:if test="@reset">
                <xsl:text>&#160;&#160;</xsl:text>
                <button id="cuesLoginResetButton" type="reset" class="cuesLoginButton" onclick="cuesResetFormFocus(this)"><xsl:value-of select="$reset"/></button>
              </xsl:if>
            </td>
          </tr>
          <tr>
            <td class="cuesLoginMainLeft" colspan="2">
              <xsl:apply-templates select="cues:loginlink"/>
            </td>
          </tr>
        </table>
      </td>
      <td valign="top" class="cuesLoginMainRight">
        <img alt="" title="">
          <xsl:attribute name="src"><xsl:value-of select="@image"/></xsl:attribute>
        </img>
      </td>
    </tr>
    <tr>
      <td colspan="2" class="cuesLoginFooterLeft" style="text-align:center;">
        <div id="cuesLoginMessage">&#160;</div>
        <script>cuesMsg["VerifyingLogin"]="<xsl:value-of select="$msgVerifyingLogin"/>";</script>
      </td>
      <td class="cuesLoginFooterRight">&#160;</td>
    </tr>
  </table>
</xsl:template>
<xsl:template match="cues:login"> 
  <form id="cuesLoginForm">
    <xsl:if test="@method">
      <xsl:attribute name="method"><xsl:value-of select="@method"/></xsl:attribute>
    </xsl:if>
    <xsl:if test="@onsubmit">
      <xsl:attribute name="onsubmit"><xsl:value-of select="@onsubmit"/></xsl:attribute>
    </xsl:if>
    <xsl:attribute name="action"><xsl:value-of select="@action"/></xsl:attribute>
    <xsl:choose>
      <xsl:when test="$CUESSTYLEVERSION >= 62">
        <xsl:call-template name="login62"/>
      </xsl:when>
      <xsl:when test="$CUESSTYLEVERSION >= 60">
        <xsl:call-template name="login60"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="login5x"/>
      </xsl:otherwise>
    </xsl:choose>
  </form>
  <xsl:if test="@focus">
    <script><xsl:text>try{document.getElementById('</xsl:text><xsl:value-of select="@focus"/><xsl:text>').focus();}catch(e){}</xsl:text></script>
  </xsl:if>
  <xsl:if test="$CUESSTYLEVERSION &lt; 60">
    <xsl:apply-templates select="cues:logincopyright"/>
  </xsl:if>
</xsl:template>
<xsl:template match="cues:loginproduct"> 
  <div class="cuesLoginProductName">
    <xsl:apply-templates/>
  </div>
</xsl:template>
<xsl:template match="cues:loginproductfamily"> 
  <div class="cuesLoginProductFamily">
    <xsl:apply-templates/>
  </div>
</xsl:template>
<xsl:template match="cues:loginproductsubtitle"> 
  <div class="cuesLoginProductSubtitle">
    <xsl:apply-templates/>
  </div>
</xsl:template>
<xsl:template match="cues:loginversion"> 
  <div class="cuesLoginVersionInfo">
    <xsl:apply-templates/>
  </div>
</xsl:template>
<xsl:template match="cues:logincopyright"> 
  <div class="cuesLoginCopyright">
    <xsl:apply-templates/>
  </div>
</xsl:template>
<xsl:template match="cues:loginerror"> 
  <xsl:choose>
    <xsl:when test="$CUESSTYLEVERSION >= 61">
      <div>
        <xsl:attribute name="class">
          <xsl:choose>
            <xsl:when test="$ISIE='1'"><xsl:text>cuesErrorText cuesLoginErrorTextIE</xsl:text></xsl:when>
            <xsl:otherwise><xsl:text>cuesErrorText cuesLoginErrorTextFF</xsl:text></xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
        <div class="cuesLoginErrorBox">
          <xsl:attribute name="id"><xsl:value-of select="@id"/>_err</xsl:attribute>
          <xsl:apply-templates/>
        </div>
        <script>
          <xsl:text>if(cuesDrawnShape==null)cuesDrawnShape=new icuesDrawnShape();</xsl:text>
          <xsl:text>cuesDrawnShape.makeContainer('</xsl:text><xsl:value-of select="@id"/><xsl:text>_err','#ffffff','67%');</xsl:text>
        </script>
      </div>
    </xsl:when>
    <xsl:otherwise>
      <div class="cuesLoginErrorBox">
        <div class="cuesErrorText">
          <xsl:attribute name="id"><xsl:value-of select="@id"/>_err</xsl:attribute>
          <xsl:apply-templates/>
        </div>
      </div>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
<xsl:template match="cues:loginstatus"> 
  <div id="cuesLoginStatus" class="cuesLoginStatus">
    <xsl:apply-templates/>
  </div>
  <xsl:if test="$CUESSTYLEVERSION >= 61">
    <script>
      if(cuesDrawnShape==null)cuesDrawnShape=new icuesDrawnShape();
      cuesDrawnShape.makeContainer("cuesLoginStatus","#ffffff","67%");
    </script>
  </xsl:if>
</xsl:template>
<xsl:template match="cues:loginfield[@fieldtype='hidden']"> 
  <input type="hidden">
    <xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute>
    <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
    <xsl:attribute name="value"><xsl:value-of select="@fieldvalue"/></xsl:attribute>
  </input>
</xsl:template>
<xsl:template match="cues:loginfield[@fieldtype='checkbox']"> 
  <tr>
    <td>&#160;</td>
    <td class="cuesLoginField">
      <nobr>
        <input type="checkbox" alt="" title="">
          <xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute>
          <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
          <xsl:if test="@fieldvalue = '1'">
            <xsl:attribute name="checked">true</xsl:attribute>
          </xsl:if>
        </input>
        <xsl:apply-templates/>
      </nobr>
    </td>
  </tr>
</xsl:template>
<xsl:template match="cues:loginfield[@fieldtype='text']"> 
  <xsl:variable name="fieldsize">
    <xsl:choose>
      <xsl:when test="@fieldsize"><xsl:value-of select="@fieldsize"/></xsl:when>
      <xsl:otherwise>20</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <tr>
    <td class="cuesLoginField">
      <label>
        <xsl:attribute name="for"><xsl:value-of select="@id"/></xsl:attribute>
      <nobr>
        <xsl:apply-templates/>
      </nobr>
      </label>
    </td>
    <td>
      <input type="text">
        <xsl:attribute name="size"><xsl:value-of select="$fieldsize"/></xsl:attribute>
        <xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute>
        <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
        <xsl:attribute name="value"><xsl:value-of select="@fieldvalue"/></xsl:attribute>
        <xsl:attribute name="alt"><xsl:value-of select="."/></xsl:attribute>
      </input>
    </td>
  </tr>
</xsl:template>
<xsl:template match="cues:loginfield[@fieldtype='password']"> 
  <xsl:variable name="fieldsize">
    <xsl:choose>
      <xsl:when test="@fieldsize"><xsl:value-of select="@fieldsize"/></xsl:when>
      <xsl:otherwise>20</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <tr>
    <td class="cuesLoginField">
      <label>
        <xsl:attribute name="for"><xsl:value-of select="@id"/></xsl:attribute>
      <nobr>
        <xsl:apply-templates/>
      </nobr>
      </label>
    </td>
    <td>
      <input type="password" autocomplete="off">
        <xsl:attribute name="size"><xsl:value-of select="$fieldsize"/></xsl:attribute>
        <xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute>
        <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
        <xsl:attribute name="value"><xsl:value-of select="@fieldvalue"/></xsl:attribute>
        <xsl:attribute name="alt"><xsl:value-of select="."/></xsl:attribute>
      </input>
    </td>
  </tr>
</xsl:template>
<xsl:template match="cues:loginfield[@fieldtype='dropdown']"> 
  <tr>
    <td class="cuesLoginField">
      <label>
        <xsl:attribute name="for"><xsl:value-of select="@id"/></xsl:attribute>
      <nobr>
        <xsl:apply-templates select="*[local-name(.) = 'localize']"/>
        <xsl:value-of select="substring-before(.,':')"/>
        <xsl:text>:</xsl:text>
      </nobr>
      </label>
    </td>
    <td>
      <select>
        <xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute>
        <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
        <xsl:if test="@fieldsize">
          <xsl:attribute name="style">width:<xsl:value-of select="@fieldsize"/></xsl:attribute>
        </xsl:if>
        <xsl:apply-templates select="option"/>
      </select>
    </td>
  </tr>
</xsl:template>
<xsl:template match="cues:loginlink"> 
  <br />
  <a class="cuesLoginLink">
    <xsl:attribute name="href"><xsl:value-of select="@onclick"/></xsl:attribute>
    <xsl:apply-templates/>
  </a>
</xsl:template>

<xsl:template match="cues:logo"> 
  <img class="cuesLoginLogo" onload="cuesFixPNG(null,this)" id="cuesLogoImage" align="absmiddle" alt="Logo" title="Logo">
    <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/<xsl:value-of select="$CUESLOGOIMAGE"/></xsl:attribute>
  </img>
</xsl:template>

<xsl:template match="cues:maskededit[@field='password']|cues:maskededit[@field='file']">
  <div class="cuesErrorText" style="display:none">
    <xsl:call-template name="addARIA"/>
    <xsl:attribute name="id"><xsl:value-of select="@id"/>_err</xsl:attribute>
    &#160;
  </div>
  <input>
    <xsl:attribute name="type"><xsl:value-of select="@field"/></xsl:attribute>
    <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
    <xsl:if test="@disabled='true'"><xsl:attribute name="disabled">true</xsl:attribute></xsl:if>
    <xsl:if test="@name"><xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute></xsl:if>
    <xsl:if test="@size"><xsl:attribute name="size"><xsl:value-of select="@size"/></xsl:attribute></xsl:if>
    <xsl:if test="@accesskey"><xsl:attribute name="accesskey"><xsl:value-of select="@acceskey"/></xsl:attribute></xsl:if>
    <xsl:if test="@maxlength"><xsl:attribute name="maxlength"><xsl:value-of select="@maxlength"/></xsl:attribute></xsl:if>
    <xsl:if test="@value"><xsl:attribute name="value"><xsl:value-of select="@value"/></xsl:attribute></xsl:if>
    <xsl:attribute name="onchange">return icuesMaskedEditOnChangeHandler2(event,this,'<xsl:value-of select="@field"/>');</xsl:attribute>
  </input>
</xsl:template>
<xsl:template match="cues:maskededit[@field='ipv4']|
                     cues:maskededit[@field='integer']|
                     cues:maskededit[@field='positiveinteger']|
                     cues:maskededit[@field='float']|
                     cues:maskededit[@field='netmask']|
                     cues:maskededit[@field='string']|
                     cues:maskededit[@field='mac']">
  <div class="cuesErrorText" style="display:none">
    <xsl:call-template name="addARIA"/>
    <xsl:attribute name="id"><xsl:value-of select="@id"/>_err</xsl:attribute>
    &#160;
  </div>
  <input type="text">
    <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
    <xsl:if test="@disabled='true'"><xsl:attribute name="disabled">true</xsl:attribute></xsl:if>
    <xsl:if test="@name"><xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute></xsl:if>
    <xsl:if test="@size"><xsl:attribute name="size"><xsl:value-of select="@size"/></xsl:attribute></xsl:if>
    <xsl:if test="@accesskey"><xsl:attribute name="accesskey"><xsl:value-of select="@acceskey"/></xsl:attribute></xsl:if>
    <xsl:if test="@maxlength"><xsl:attribute name="maxlength"><xsl:value-of select="@maxlength"/></xsl:attribute></xsl:if>
    <xsl:if test="@value"><xsl:attribute name="value"><xsl:value-of select="@value"/></xsl:attribute></xsl:if>
    <xsl:attribute name="onkeypress">return icuesMaskedEditOnKeyHandler(event,'<xsl:value-of select="@field"/>');</xsl:attribute>
    <xsl:attribute name="onblur">return icuesMaskedEditOnBlurHandler(event,this,'<xsl:value-of select="@field"/>');</xsl:attribute>
    <xsl:attribute name="onchange">return icuesMaskedEditOnChangeHandler2(event,this,'<xsl:value-of select="@field"/>');</xsl:attribute>
  </input>
</xsl:template>
<xsl:template match="cues:maskededit[@field='date']">
  <xsl:variable name="activemonth">
    <xsl:choose>
      <xsl:when test="@value">
        <xsl:variable name="monthday"><xsl:value-of select="substring-after(@value,'-')"/></xsl:variable>
        <xsl:value-of select="substring-before($monthday,'-')"/>  
      </xsl:when>
      <xsl:otherwise>1</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="activeday">
    <xsl:choose>
      <xsl:when test="@value">
        <xsl:variable name="monthday"><xsl:value-of select="substring-after(@value,'-')"/></xsl:variable>
        <xsl:value-of select="substring-after($monthday,'-')"/>  
      </xsl:when>
      <xsl:otherwise>1</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="activeyear">
    <xsl:choose>
      <xsl:when test="@value">
        <xsl:value-of select="substring-before(@value,'-')"/>  
      </xsl:when>
      <xsl:otherwise>2009</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <div class="cuesErrorText" style="display:none">
    <xsl:call-template name="addARIA"/>
    <xsl:attribute name="id"><xsl:value-of select="@id"/>_err</xsl:attribute>
    &#160;
  </div>
  <input type="hidden">
    <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
    <xsl:if test="@disabled='true'"><xsl:attribute name="disabled">true</xsl:attribute></xsl:if>
    <xsl:if test="@name"><xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute></xsl:if>
    <xsl:if test="@size"><xsl:attribute name="size"><xsl:value-of select="@size"/></xsl:attribute></xsl:if>
    <xsl:if test="@maxlength"><xsl:attribute name="maxlength"><xsl:value-of select="@maxlength"/></xsl:attribute></xsl:if>
    <xsl:if test="@value"><xsl:attribute name="value"><xsl:value-of select="@value"/></xsl:attribute></xsl:if>
  </input>
  <nobr>
    <select>
      <xsl:if test="@disabled='true'"><xsl:attribute name="disabled">true</xsl:attribute></xsl:if>
      <xsl:attribute name="onchange">return icuesMaskedEditOnChangeHandler(event,this,'<xsl:value-of select="@field"/>');</xsl:attribute>
      <xsl:attribute name="id"><xsl:value-of select="@id"/>_month</xsl:attribute>
      <option value="0">
        <xsl:if test="number($activemonth)=1">
          <xsl:attribute name="checked">true</xsl:attribute>
          <xsl:attribute name="selected">true</xsl:attribute>
        </xsl:if>
        <xsl:value-of select="$jan"/></option>
      <option value="1">
        <xsl:if test="number($activemonth)=2">
          <xsl:attribute name="checked">true</xsl:attribute>
          <xsl:attribute name="selected">true</xsl:attribute>
        </xsl:if>
        <xsl:value-of select="$feb"/></option>
      <option value="2">
        <xsl:if test="number($activemonth)=3">
          <xsl:attribute name="checked">true</xsl:attribute>
          <xsl:attribute name="selected">true</xsl:attribute>
        </xsl:if>
        <xsl:value-of select="$mar"/></option>
      <option value="3">
        <xsl:if test="number($activemonth)=4">
          <xsl:attribute name="checked">true</xsl:attribute>
          <xsl:attribute name="selected">true</xsl:attribute>
        </xsl:if>
        <xsl:value-of select="$apr"/></option>
      <option value="4">
        <xsl:if test="number($activemonth)=5">
          <xsl:attribute name="checked">true</xsl:attribute>
          <xsl:attribute name="selected">true</xsl:attribute>
        </xsl:if>
        <xsl:value-of select="$may"/></option>
      <option value="5">
        <xsl:if test="number($activemonth)=6">
          <xsl:attribute name="checked">true</xsl:attribute>
          <xsl:attribute name="selected">true</xsl:attribute>
        </xsl:if>
        <xsl:value-of select="$jun"/></option>
      <option value="6">
        <xsl:if test="number($activemonth)=7">
          <xsl:attribute name="checked">true</xsl:attribute>
          <xsl:attribute name="selected">true</xsl:attribute>
        </xsl:if>
        <xsl:value-of select="$jul"/></option>
      <option value="7">
        <xsl:if test="number($activemonth)=8">
          <xsl:attribute name="checked">true</xsl:attribute>
          <xsl:attribute name="selected">true</xsl:attribute>
        </xsl:if>
        <xsl:value-of select="$aug"/></option>
      <option value="8">
        <xsl:if test="number($activemonth)=9">
          <xsl:attribute name="checked">true</xsl:attribute>
          <xsl:attribute name="selected">true</xsl:attribute>
        </xsl:if>
        <xsl:value-of select="$sep"/></option>
      <option value="9">
        <xsl:if test="number($activemonth)=10">
          <xsl:attribute name="checked">true</xsl:attribute>
          <xsl:attribute name="selected">true</xsl:attribute>
        </xsl:if>
        <xsl:value-of select="$oct"/></option>
      <option value="10">
        <xsl:if test="number($activemonth)=11">
          <xsl:attribute name="checked">true</xsl:attribute>
          <xsl:attribute name="selected">true</xsl:attribute>
        </xsl:if>
        <xsl:value-of select="$nov"/></option>
      <option value="11">
        <xsl:if test="number($activemonth)=12">
          <xsl:attribute name="checked">true</xsl:attribute>
          <xsl:attribute name="selected">true</xsl:attribute>
        </xsl:if>
        <xsl:value-of select="$dec"/></option>
    </select>
    <xsl:text>&#160;</xsl:text>
    <select>
      <xsl:if test="@disabled='true'"><xsl:attribute name="disabled">true</xsl:attribute></xsl:if>
      <xsl:attribute name="onchange">return icuesMaskedEditOnChangeHandler(event,this,'<xsl:value-of select="@field"/>');</xsl:attribute>
      <xsl:attribute name="id"><xsl:value-of select="@id"/>_day</xsl:attribute>
      <xsl:call-template name="buildnumericoption">
        <xsl:with-param name="value">1</xsl:with-param>
        <xsl:with-param name="incr">0</xsl:with-param>
        <xsl:with-param name="limit">32</xsl:with-param>
        <xsl:with-param name="selected"><xsl:value-of select="$activeday"/></xsl:with-param>
      </xsl:call-template>
    </select>
    <xsl:text>&#160;</xsl:text>
    <select>
      <xsl:if test="@disabled='true'"><xsl:attribute name="disabled">true</xsl:attribute></xsl:if>
      <xsl:attribute name="onchange">return icuesMaskedEditOnChangeHandler(event,this,'<xsl:value-of select="@field"/>');</xsl:attribute>
      <xsl:attribute name="id"><xsl:value-of select="@id"/>_year</xsl:attribute>
      <xsl:call-template name="buildnumericoption">
        <xsl:with-param name="value">2007</xsl:with-param>
        <xsl:with-param name="incr">0</xsl:with-param>
        <xsl:with-param name="limit">2014</xsl:with-param>
        <xsl:with-param name="selected"><xsl:value-of select="$activeyear"/></xsl:with-param>
      </xsl:call-template>
    </select>
  </nobr>
  <script>icuesInitMaskedEditRetValue('<xsl:value-of select="@id"/>','<xsl:value-of select="@field"/>');</script>
</xsl:template>
<xsl:template match="cues:maskededit[@field='time']">
  <div class="cuesErrorText" style="display:none">
    <xsl:call-template name="addARIA"/>
    <xsl:attribute name="id"><xsl:value-of select="@id"/>_err</xsl:attribute>
    &#160;
  </div>
  <input type="hidden">
    <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
    <xsl:if test="@disabled='true'"><xsl:attribute name="disabled">true</xsl:attribute></xsl:if>
    <xsl:if test="@name"><xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute></xsl:if>
    <xsl:if test="@size"><xsl:attribute name="size"><xsl:value-of select="@size"/></xsl:attribute></xsl:if>
    <xsl:if test="@maxlength"><xsl:attribute name="maxlength"><xsl:value-of select="@maxlength"/></xsl:attribute></xsl:if>
    <xsl:if test="@value"><xsl:attribute name="value"><xsl:value-of select="@value"/></xsl:attribute></xsl:if>
  </input>
  <nobr>
    <select>
      <xsl:if test="@disabled='true'"><xsl:attribute name="disabled">true</xsl:attribute></xsl:if>
      <xsl:attribute name="onchange">return icuesMaskedEditOnChangeHandler(event,this,'<xsl:value-of select="@field"/>');</xsl:attribute>
      <xsl:attribute name="id"><xsl:value-of select="@id"/>_hour</xsl:attribute>
      <xsl:call-template name="buildnumericoption">
        <xsl:with-param name="value">0</xsl:with-param>
        <xsl:with-param name="incr">1</xsl:with-param>
        <xsl:with-param name="limit">12</xsl:with-param>
      </xsl:call-template>
    </select>
    <xsl:text>&#160;</xsl:text>
    <select>
      <xsl:if test="@disabled='true'"><xsl:attribute name="disabled">true</xsl:attribute></xsl:if>
      <xsl:attribute name="onchange">return icuesMaskedEditOnChangeHandler(event,this,'<xsl:value-of select="@field"/>');</xsl:attribute>
      <xsl:attribute name="id"><xsl:value-of select="@id"/>_min</xsl:attribute>
      <xsl:call-template name="buildnumericoption">
        <xsl:with-param name="value">0</xsl:with-param>
        <xsl:with-param name="incr">0</xsl:with-param>
        <xsl:with-param name="limit">60</xsl:with-param>
      </xsl:call-template>
    </select>
    <xsl:text>&#160;</xsl:text>
    <select>
      <xsl:if test="@disabled='true'"><xsl:attribute name="disabled">true</xsl:attribute></xsl:if>
      <xsl:attribute name="onchange">return icuesMaskedEditOnChangeHandler(event,this,'<xsl:value-of select="@field"/>');</xsl:attribute>
      <xsl:attribute name="id"><xsl:value-of select="@id"/>_ampm</xsl:attribute>
      <option value="0">AM</option>
      <option value="1">PM</option>
    </select>
  </nobr>
  <script>icuesInitMaskedEditRetValue('<xsl:value-of select="@id"/>','<xsl:value-of select="@field"/>');</script>
</xsl:template>
<xsl:template match="cues:maskededit[@field='time2']">
  <div class="cuesErrorText" style="display:none">
    <xsl:call-template name="addARIA"/>
    <xsl:attribute name="id"><xsl:value-of select="@id"/>_err</xsl:attribute>
    &#160;
  </div>
  <input type="hidden">
    <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
    <xsl:if test="@disabled='true'"><xsl:attribute name="disabled">true</xsl:attribute></xsl:if>
    <xsl:if test="@name"><xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute></xsl:if>
    <xsl:if test="@size"><xsl:attribute name="size"><xsl:value-of select="@size"/></xsl:attribute></xsl:if>
    <xsl:if test="@maxlength"><xsl:attribute name="maxlength"><xsl:value-of select="@maxlength"/></xsl:attribute></xsl:if>
    <xsl:if test="@value"><xsl:attribute name="value"><xsl:value-of select="@value"/></xsl:attribute></xsl:if>
  </input>
  <nobr>
    <input alt="Time" size="5" maxlength="5" type="text">
      <xsl:attribute name="onkeypress">return icuesMaskedEditOnKeyHandler(event,'<xsl:value-of select="@field"/>');</xsl:attribute>
      <xsl:attribute name="onblur">return icuesMaskedEditOnBlurHandler(event,this,'<xsl:value-of select="@field"/>');</xsl:attribute>
      <xsl:attribute name="id"><xsl:value-of select="@id"/>_hourmin</xsl:attribute>
      <xsl:if test="@value"><xsl:attribute name="value"><xsl:value-of select="@value"/></xsl:attribute></xsl:if>
    </input>          
    <xsl:text>&#160;</xsl:text>
    <select>
      <xsl:if test="@disabled='true'"><xsl:attribute name="disabled">true</xsl:attribute></xsl:if>
      <xsl:attribute name="onchange">return icuesMaskedEditOnChangeHandler(event,this,'<xsl:value-of select="@field"/>');</xsl:attribute>
      <xsl:attribute name="id"><xsl:value-of select="@id"/>_ampm</xsl:attribute>
      <option value="0">AM</option>
      <option value="1">PM</option>
    </select>
  </nobr>
  <script>icuesInitMaskedEditRetValue('<xsl:value-of select="@id"/>','<xsl:value-of select="@field"/>');</script>
</xsl:template>
<xsl:template match="cues:maskededit[@field='miltime']">
  <div class="cuesErrorText" style="display:none">
    <xsl:call-template name="addARIA"/>
    <xsl:attribute name="id"><xsl:value-of select="@id"/>_err</xsl:attribute>
    &#160;
  </div>
  <input type="hidden">
    <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
    <xsl:if test="@disabled='true'"><xsl:attribute name="disabled">true</xsl:attribute></xsl:if>
    <xsl:if test="@name"><xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute></xsl:if>
    <xsl:if test="@size"><xsl:attribute name="size"><xsl:value-of select="@size"/></xsl:attribute></xsl:if>
    <xsl:if test="@maxlength"><xsl:attribute name="maxlength"><xsl:value-of select="@maxlength"/></xsl:attribute></xsl:if>
    <xsl:if test="@value"><xsl:attribute name="value"><xsl:value-of select="@value"/></xsl:attribute></xsl:if>
  </input>
  <nobr>
    <select>
      <xsl:if test="@disabled='true'"><xsl:attribute name="disabled">true</xsl:attribute></xsl:if>
      <xsl:attribute name="onchange">return icuesMaskedEditOnChangeHandler(event,this,'<xsl:value-of select="@field"/>');</xsl:attribute>
      <xsl:attribute name="id"><xsl:value-of select="@id"/>_hour</xsl:attribute>
      <xsl:call-template name="buildnumericoption">
        <xsl:with-param name="value">0</xsl:with-param>
        <xsl:with-param name="incr">0</xsl:with-param>
        <xsl:with-param name="limit">24</xsl:with-param>
      </xsl:call-template>
    </select>
    <xsl:text>&#160;</xsl:text>
    <select>
      <xsl:if test="@disabled='true'"><xsl:attribute name="disabled">true</xsl:attribute></xsl:if>
      <xsl:attribute name="onchange">return icuesMaskedEditOnChangeHandler(event,this,'<xsl:value-of select="@field"/>');</xsl:attribute>
      <xsl:attribute name="id"><xsl:value-of select="@id"/>_min</xsl:attribute>
      <xsl:call-template name="buildnumericoption">
        <xsl:with-param name="value">0</xsl:with-param>
        <xsl:with-param name="incr">0</xsl:with-param>
        <xsl:with-param name="limit">60</xsl:with-param>
      </xsl:call-template>
    </select>
  </nobr>
  <script>icuesInitMaskedEditRetValue('<xsl:value-of select="@id"/>','<xsl:value-of select="@field"/>');</script>
</xsl:template>
<xsl:template match="cues:maskededit[@field='miltime2']">
  <div class="cuesErrorText" style="display:none">
    <xsl:call-template name="addARIA"/>
    <xsl:attribute name="id"><xsl:value-of select="@id"/>_err</xsl:attribute>
    &#160;
  </div>
  <input size="5" maxlength="5" type="text">
    <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
    <xsl:if test="@disabled='true'"><xsl:attribute name="disabled">true</xsl:attribute></xsl:if>
    <xsl:if test="@name"><xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute></xsl:if>
    <xsl:if test="@accesskey"><xsl:attribute name="accesskey"><xsl:value-of select="@acceskey"/></xsl:attribute></xsl:if>
    <xsl:if test="@value"><xsl:attribute name="value"><xsl:value-of select="@value"/></xsl:attribute></xsl:if>
    <xsl:attribute name="onkeypress">return icuesMaskedEditOnKeyHandler(event,'<xsl:value-of select="@field"/>');</xsl:attribute>
    <xsl:attribute name="onblur">return icuesMaskedEditOnBlurHandler(event,this,'<xsl:value-of select="@field"/>');</xsl:attribute>
  </input>          
</xsl:template>
<xsl:template match="cues:maskededit[@field='ipv6']">
  <xsl:variable name="ipv6address">
    <xsl:choose>
      <xsl:when test="contains(@value,'/')">
        <xsl:value-of select="substring-before(@value,'/')"/>  
      </xsl:when>
      <xsl:when test="@value">
        <xsl:value-of select="@value"/>  
      </xsl:when>
      <xsl:otherwise></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="ipv6mask">
    <xsl:choose>
      <xsl:when test="@value">
        <xsl:value-of select="substring-after(@value,'/')"/>  
      </xsl:when>
      <xsl:otherwise></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <div class="cuesErrorText" style="display:none">
    <xsl:call-template name="addARIA"/>
    <xsl:attribute name="id"><xsl:value-of select="@id"/>_err</xsl:attribute>
    &#160;
  </div>
  <input type="hidden">
    <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
    <xsl:if test="@disabled='true'"><xsl:attribute name="disabled">true</xsl:attribute></xsl:if>
    <xsl:if test="@name"><xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute></xsl:if>
    <xsl:if test="@size"><xsl:attribute name="size"><xsl:value-of select="@size"/></xsl:attribute></xsl:if>
    <xsl:if test="@maxlength"><xsl:attribute name="maxlength"><xsl:value-of select="@maxlength"/></xsl:attribute></xsl:if>
    <xsl:if test="@value"><xsl:attribute name="value"><xsl:value-of select="@value"/></xsl:attribute></xsl:if>
  </input>
  <nobr>
  <input alt="Address" size="39" maxlength="39" type="text" 
         onchange="return icuesMaskedEditOnChangeHandler(event,this,'ipv6')" 
         onkeypress="return icuesMaskedEditOnKeyHandler(event,'ipv6')" 
         onblur="return icuesMaskedEditOnBlurHandler(event,this,'ipv6')">
    <xsl:attribute name="value"><xsl:value-of select="$ipv6address"/></xsl:attribute>  
    <xsl:attribute name="id"><xsl:value-of select="@id"/>_address</xsl:attribute>  
    <xsl:if test="@disabled='true'"><xsl:attribute name="disabled">true</xsl:attribute></xsl:if>
  </input>
  &#160;
  <input alt="Mask" size="5" maxlength="4" type="text" 
         onchange="return icuesMaskedEditOnChangeHandler(event,this,'ipv6')" 
         onkeypress="return icuesMaskedEditOnKeyHandler(event,'ipv6mask')" 
         onblur="return icuesMaskedEditOnBlurHandler(event,this,'ipv6mask')">
    <xsl:attribute name="id"><xsl:value-of select="@id"/>_mask</xsl:attribute>
    <xsl:attribute name="value"><xsl:value-of select="$ipv6mask"/></xsl:attribute>  
    <xsl:if test="@disabled='true'"><xsl:attribute name="disabled">true</xsl:attribute></xsl:if>
  </input>
  </nobr>
  <script>icuesInitMaskedEditRetValue('<xsl:value-of select="@id"/>','<xsl:value-of select="@field"/>');</script>
</xsl:template>

<xsl:template match="cues:pagecontrols[@group='paging']">
  <table cellpadding="0" cellspacing="0" class="cuesTablePagingGoto">
    <tr>
      <td><xsl:value-of select="$page"/>&#160;</td>
      <td>
        <input style="text-align:right" type="text" size="3">
          <xsl:attribute name="id">activepage_<xsl:value-of select="@id"/></xsl:attribute>
          <xsl:attribute name="value"><xsl:value-of select="@currentpage"/></xsl:attribute>
          <xsl:attribute name="onkeypress"><xsl:text>return cuesPagingTableGoToHandler(event,this,'</xsl:text><xsl:value-of select="@id"/><xsl:text>','</xsl:text><xsl:value-of select="@rowsperpage"/><xsl:text>')</xsl:text></xsl:attribute>
        </input>
      </td>
      <td>
        <xsl:text>&#160;</xsl:text>
        <xsl:value-of select="$of"/>
        <xsl:text>&#160;</xsl:text>
        <span>
          <xsl:attribute name="id">totalpages_<xsl:value-of select="@id"/></xsl:attribute>
          <xsl:value-of select="@totalpages"/>
        </span>
        <xsl:text>&#160;</xsl:text>
      </td>
      <td>
        <button type="button" class="cuesTablePagingButton">
          <xsl:attribute name="id">firstpage_<xsl:value-of select="@id"/></xsl:attribute>
          <xsl:attribute name="onclick"><xsl:text>cuesPageTable('</xsl:text><xsl:value-of select="@id"/><xsl:text>',1,-2,'</xsl:text><xsl:value-of select="@rowsperpage"/><xsl:text>')</xsl:text></xsl:attribute>
          <xsl:if test="@currentpage=1"><xsl:attribute name="disabled">true</xsl:attribute></xsl:if>
          <img border="0">
            <xsl:attribute name="title"><xsl:value-of select="$firstpage"/></xsl:attribute>
            <xsl:attribute name="alt"><xsl:value-of select="$firstpage"/></xsl:attribute>
            <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/First</xsl:text><xsl:if test="@currentpage='1'"><xsl:text>-D</xsl:text></xsl:if><xsl:text>.gif</xsl:text></xsl:attribute>
          </img>
        </button>
        <xsl:text>&#160;</xsl:text>
        <button type="button" class="cuesTablePagingButton">
          <xsl:attribute name="id">prevpage_<xsl:value-of select="@id"/></xsl:attribute>
          <xsl:attribute name="onclick"><xsl:text>cuesPageTable('</xsl:text><xsl:value-of select="@id"/><xsl:text>',</xsl:text><xsl:value-of select="@currentpage"/><xsl:text>,-1,'</xsl:text><xsl:value-of select="@rowsperpage"/><xsl:text>')</xsl:text></xsl:attribute>
          <xsl:if test="@currentpage=1"><xsl:attribute name="disabled">true</xsl:attribute></xsl:if>
          <img border="0">
            <xsl:attribute name="title"><xsl:value-of select="$previouspage"/></xsl:attribute>
            <xsl:attribute name="alt"><xsl:value-of select="$previouspage"/></xsl:attribute>
            <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/Previous</xsl:text><xsl:if test="@currentpage='1'"><xsl:text>-D</xsl:text></xsl:if><xsl:text>.gif</xsl:text></xsl:attribute>
          </img>
        </button>
        <xsl:text>&#160;</xsl:text>
        <button type="button" class="cuesTablePagingButton">
          <xsl:attribute name="id">nextpage_<xsl:value-of select="@id"/></xsl:attribute>
          <xsl:attribute name="onclick"><xsl:text>cuesPageTable('</xsl:text><xsl:value-of select="@id"/><xsl:text>',</xsl:text><xsl:value-of select="@currentpage"/><xsl:text>,1,'</xsl:text><xsl:value-of select="@rowsperpage"/><xsl:text>')</xsl:text></xsl:attribute>
          <xsl:if test="@currentpage=@totalpages"><xsl:attribute name="disabled">true</xsl:attribute></xsl:if>
          <img border="0">
            <xsl:attribute name="title"><xsl:value-of select="$nextpage"/></xsl:attribute>
            <xsl:attribute name="alt"><xsl:value-of select="$nextpage"/></xsl:attribute>
            <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/Next</xsl:text><xsl:if test="@currentpage=@totalpages"><xsl:text>-D</xsl:text></xsl:if><xsl:text>.gif</xsl:text></xsl:attribute>
          </img>
        </button>
        <xsl:text>&#160;</xsl:text>
        <button type="button" class="cuesTablePagingButton">
          <xsl:attribute name="id">lastpage_<xsl:value-of select="@id"/></xsl:attribute>
          <xsl:attribute name="onclick"><xsl:text>cuesPageTable('</xsl:text><xsl:value-of select="@id"/><xsl:text>',</xsl:text><xsl:value-of select="@totalpages"/><xsl:text>,2,'</xsl:text><xsl:value-of select="@rowsperpage"/><xsl:text>')</xsl:text></xsl:attribute>
          <xsl:if test="@currentpage=@totalpages"><xsl:attribute name="disabled">true</xsl:attribute></xsl:if>
          <img border="0">
            <xsl:attribute name="title"><xsl:value-of select="$lastpage"/></xsl:attribute>
            <xsl:attribute name="alt"><xsl:value-of select="$lastpage"/></xsl:attribute>
            <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/Last</xsl:text><xsl:if test="@currentpage=@totalpages"><xsl:text>-D</xsl:text></xsl:if><xsl:text>.gif</xsl:text></xsl:attribute>
          </img>
        </button>
      </td>
    </tr>
  </table>
</xsl:template>


<xsl:template match="cues:pageheader">
  <xsl:variable name="abbreviated">
    <xsl:choose>
      <xsl:when test="@abbreviated"><xsl:value-of select="@abbreviated"/></xsl:when>
      <xsl:otherwise>false</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="headerheight">
    <xsl:choose>
      <xsl:when test="@navlink">54</xsl:when>
      <xsl:otherwise>45</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="navlabel">
    <xsl:choose>
      <xsl:when test="@navlabel"><xsl:value-of select="@navlabel"/></xsl:when>
      <xsl:otherwise>Navigation:</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="logo">
    <xsl:choose>
      <xsl:when test="@logo"><xsl:value-of select="@logo"/></xsl:when>
      <xsl:otherwise>true</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="logourl">
    <xsl:choose>
      <xsl:when test="@logourl"><xsl:value-of select="@logourl"/></xsl:when>
      <xsl:otherwise>http://www.cisco.com</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:choose>
    <xsl:when test="$CUESSTYLEVERSION &lt; 60">  
      <div id="cuesPageHeader" style="width:100%">
        <table border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td>
              <img title="" alt="" width="1">
                <xsl:attribute name="height"><xsl:value-of select="$headerheight"/></xsl:attribute>
                <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/HeaderBeg.gif</xsl:attribute>
              </img>
            </td>
            <td>
              <img title="" alt="" width="1">
                <xsl:attribute name="height"><xsl:value-of select="$headerheight"/></xsl:attribute>
                <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/HeaderMid.gif</xsl:attribute>
              </img>
              </td>
            <td>
              <img title="" alt="" width="1">
                <xsl:attribute name="height"><xsl:value-of select="$headerheight"/></xsl:attribute>
                <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/HeaderEnd.gif</xsl:attribute>
              </img>
            </td>
          </tr>
        </table>
        <div id="cuesPageHeaderData" style="position:relative">
          <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <xsl:attribute name="height"><xsl:value-of select="$headerheight"/></xsl:attribute>
            <tr>
              <xsl:if test="$logo='true'">
                <td>
                  <img onload="cuesFixPNG(null,this)" id="cuesHeaderLogoImage" align="absmiddle">
                    <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/headerCiscoLogo.png</xsl:attribute>
                    <xsl:attribute name="title"><xsl:value-of select="$companylogo"/></xsl:attribute>
                    <xsl:attribute name="alt"><xsl:value-of select="$companylogo"/></xsl:attribute>
                    <xsl:if test="$logourl != ''">
                      <xsl:attribute name="onmouseover"><xsl:text>this.style.cursor='pointer'</xsl:text></xsl:attribute>
                      <xsl:attribute name="onclick"><xsl:text>window.open('</xsl:text><xsl:value-of select="$logourl"/><xsl:text>')</xsl:text></xsl:attribute>
                    </xsl:if>
                  </img>
                </td>
              </xsl:if>
              <td class="cuesHeaderTitleLogo">
                <nobr>
                  <xsl:value-of select="@title"/>
                  <xsl:if test="@subtitle">
                    <br/>
                    <div class="cuesHeaderSubtitle">
                      <xsl:value-of select="@subtitle"/>
                    </div>
                  </xsl:if>
                </nobr>
              </td>
              <td width="100%"><xsl:text> </xsl:text></td>
              <xsl:choose>
                <xsl:when test="@navlink">
                  <td valign="top">
                    <div style="float:right;">
                      <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td class="cuesHeaderNavArea">

                            <xsl:choose>
                              
                              <xsl:when test="$abbreviated='true'">
                                <nobr>
                                  <xsl:text>&#160;</xsl:text>
                                  <xsl:value-of select="$navlabel"/>
                                </nobr>
                                <br/>
                                <nobr>                          
                                  <xsl:text>&#160;</xsl:text>
                                  <select id="cuesHeaderNavLink">
                                    <xsl:attribute name="title"><xsl:value-of select="$navlabel"/></xsl:attribute>
                                    <xsl:apply-templates select="cues:pageheadernavitem"/>
                                  </select>
                                  <xsl:text>&#160;</xsl:text>
                                  <button type="button">
                                    <xsl:attribute name="onclick"><xsl:value-of select="@navlink"/></xsl:attribute>
                                    <xsl:value-of select="$go"/>
                                  </button>
                                </nobr>
                              </xsl:when>
                              <xsl:otherwise>
                                <nobr>
                                  <xsl:text>&#160;</xsl:text>
                                  <xsl:value-of select="$navlabel"/>
                                  <xsl:text>&#160;</xsl:text>
                                  <select id="cuesHeaderNavLink">
                                    <xsl:apply-templates select="cues:pageheadernavitem"/>
                                  </select>
                                  <xsl:text>&#160;</xsl:text>
                                  <button type="button">
                                    <xsl:attribute name="onclick"><xsl:value-of select="@navlink"/></xsl:attribute>
                                    <xsl:value-of select="$go"/>
                                  </button>
                                </nobr>
                              </xsl:otherwise>
                            </xsl:choose>
                          </td>
                        </tr>
                      </table>
                    </div>
                    <br/>
                    <br/>
                    <div class="cuesHeaderTextArea">
                      <nobr>
                        <xsl:apply-templates select="cues:pageheaderitem"/>
                        <xsl:call-template name="pageheader_std_links"/>
                      </nobr>
                    </div>
                  </td>
                </xsl:when>
                <xsl:otherwise>
                  <td class="cuesHeaderTextArea" nowrap="yes">
                    <nobr>
                      <xsl:apply-templates select="cues:pageheaderitem"/>
                      <xsl:call-template name="pageheader_std_links"/>
                    </nobr>
                  </td>
                </xsl:otherwise>
              </xsl:choose>
            </tr>
          </table>
        </div>
      </div>
      <script>cuesAlignPageHeader(null);</script>
    </xsl:when>
    <xsl:otherwise>
      <div id="cuesPageHeader" style="width:100%">
      <table class="cuesHeaderTable" border="0" cellpadding="1" cellspacing="0">
        <tr>
          <xsl:if test="$logo='true'">
            <td valign="bottom" style="padding-bottom:4px;padding-right:15px;">
              <img onload="cuesFixPNG(null,this)" id="cuesHeaderLogoImage" align="absmiddle">
                <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/<xsl:value-of select="$CUESHEADERIMAGE"/></xsl:attribute>
                <xsl:attribute name="title"><xsl:value-of select="$companylogo"/></xsl:attribute>
                <xsl:attribute name="alt"><xsl:value-of select="$companylogo"/></xsl:attribute>
                <xsl:if test="$logourl != ''">
                  <xsl:attribute name="onmouseover"><xsl:text>this.style.cursor='pointer'</xsl:text></xsl:attribute>
                  <xsl:attribute name="onclick"><xsl:text>window.open('</xsl:text><xsl:value-of select="$logourl"/><xsl:text>')</xsl:text></xsl:attribute>
                </xsl:if>
              </img>
            </td>
          </xsl:if>          

          <td class="cuesHeaderTitleLogo" valign="bottom">
            <xsl:if test="$logo='false'">
              <xsl:attribute name="class">cuesHeaderTitleNoLogo</xsl:attribute>
            </xsl:if>
            <nobr>
              <xsl:call-template name="lookup">
                <xsl:with-param name="key" select="@title"/>
                <xsl:with-param name="keyed" select="@titleaskey"/>
                <xsl:with-param name="locale" select="@setLocale"/>
              </xsl:call-template>
              <xsl:if test="@subtitle">
                <br/>
                <div class="cuesHeaderSubtitle">
                  <xsl:call-template name="lookup">
                    <xsl:with-param name="key" select="@subtitle"/>
                    <xsl:with-param name="keyed" select="@subtitleaskey"/>
                    <xsl:with-param name="locale" select="@setLocale"/>
                  </xsl:call-template>
                </div>
              </xsl:if>
            </nobr>
          </td>

          <td width="100%">&#160;</td>
          
          <xsl:choose>
            <xsl:when test="@navlink">
              <td valign="top">
                <div style="float:right;padding-bottom:8px;">
                  <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td class="cuesHeaderNavArea">

                        <xsl:choose>
                          <xsl:when test="$CUESSTYLEVERSION >= 62">  
                            <div id="cuesappswitcherbox">
                              <xsl:attribute name="class">
                                <xsl:text>cuesAppSwitcherBox</xsl:text>
                                <xsl:if test="$RTL='1'"><xsl:text>RTL</xsl:text></xsl:if>
                              </xsl:attribute>
                            &#160;</div>
                            <script>if(cuesDrawnShape==null)cuesDrawnShape=new icuesDrawnShape();
                              cuesDrawnShape.makeGradientBox('cuesappswitcherbox', 'leftright', '#ffffff', 0, '#ffffff', .2);
                            </script>
                            <a href="javascript:void(0)"  
                               class="cuesAppSwitcher"
                               id="cuesappswitcher" 
                               onkeydown="return cuesButtonMenuOnKeyHandler(this,event)" 
                               onclick="cuesButtonMenuClick(this, event, true)">
                              <xsl:value-of select="$navlabel"/>
                              <xsl:text>&#160;</xsl:text>
                              <img border="0" 
                                   style="vertical-align:middle;">
                                <xsl:attribute name="src">
                                  <xsl:value-of select="$CUESKNOWNLOCATION"/>
                                  <xsl:text>cues_images/application_switcher</xsl:text>
                                  <xsl:if test="$CUESCSSMODE='highcontrast'">
                                    <xsl:text>_HC</xsl:text>
                                  </xsl:if>
                                  <xsl:text>.gif</xsl:text>
                                </xsl:attribute>
                              </img>
                            </a>
                            <span style="z-index:99;position:relative;">
                            <div id="cuesappswitchermenu" style="display:none;position:absolute;top:0px;left:0px;">
                              <ul class="cuesButtonMenu cuesButtonMenuIE cuesButtonMenuLTR">
                                <xsl:attribute name="class">
                                  <xsl:text>cuesButtonMenu</xsl:text>
                                  <xsl:if test="$ISIE='1'"><xsl:text> cuesButtonMenuIE</xsl:text></xsl:if>
                                  <xsl:choose>
                                    <xsl:when test="$RTL='1'"><xsl:text> cuesButtonMenuRTL</xsl:text></xsl:when>
                                    <xsl:otherwise><xsl:text> cuesButtonMenuLTR</xsl:text></xsl:otherwise>
                                  </xsl:choose>
                                </xsl:attribute>
                                <xsl:apply-templates select="cues:pageheadernavitem" mode="appswitcher"/>
                              </ul>
                              <xsl:if test="$ISIE='1'">
                                <iframe title="" style="position:absolute;top:0px;left:0px;z-index:-1;width:100%;height:100%;" id="cuesappswitcherblock" src="about:blank"></iframe>
                              </xsl:if>
                            </div>
                            </span>
                            <script>cuesSetButtonmenuState('cuesappswitcher');</script>
                          </xsl:when>                          
                          <xsl:when test="$abbreviated='true'">
                            <nobr>
                              <xsl:text>&#160;</xsl:text>
                              <xsl:value-of select="$navlabel"/>
                            </nobr>
                            <br/>
                            <nobr>                          
                              <xsl:text>&#160;</xsl:text>
                              <select id="cuesHeaderNavLink">
                                <xsl:apply-templates select="cues:pageheadernavitem"/>
                              </select>
                              <xsl:text>&#160;</xsl:text>
                              <button type="button">
                                <xsl:attribute name="onclick"><xsl:value-of select="@navlink"/></xsl:attribute>
                                <xsl:value-of select="$go"/>
                              </button>
                            </nobr>
                          </xsl:when>
                          <xsl:otherwise>
                            <nobr>
                              <xsl:text>&#160;</xsl:text>
                              <xsl:value-of select="$navlabel"/>
                              <xsl:text>&#160;</xsl:text>
                              <select id="cuesHeaderNavLink">
                                <xsl:apply-templates select="cues:pageheadernavitem"/>
                              </select>
                              <xsl:text>&#160;</xsl:text>
                              <button type="button">
                                <xsl:attribute name="onclick"><xsl:value-of select="@navlink"/></xsl:attribute>
                                <xsl:value-of select="$go"/>
                              </button>
                            </nobr>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                  </table>
                </div>                
                <xsl:if test="$abbreviated='false'">
                  <div class="cuesHeaderTextArea">
                    <nobr>
                      <xsl:apply-templates select="cues:pageheaderitem"/>
                      <xsl:call-template name="pageheader_std_links"/>
                    </nobr>
                  </div>
                </xsl:if>
              </td>
            </xsl:when>
            <xsl:otherwise>
              <td nowrap="yes" valign="top">
                <div class="cuesHeaderTextArea">
                  <nobr>
                    <xsl:apply-templates select="cues:pageheaderitem"/>
                    <xsl:call-template name="pageheader_std_links"/>
                  </nobr>
                </div>
              </td>
            </xsl:otherwise>
          </xsl:choose>
        </tr>
      </table>
      </div>
      <script>cuesAlignPageHeader(null);</script>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
<xsl:template name="pageheader_std_links">
  <xsl:variable name="abbreviated">
    <xsl:choose>
      <xsl:when test="@abbreviated='true'">1</xsl:when>
      <xsl:otherwise>0</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="public">
    <xsl:choose>
      <xsl:when test="@public='true'">1</xsl:when>
      <xsl:otherwise>0</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:if test="$abbreviated = 0">
    <xsl:if test="$public = 0">
      <a class="cuesHeaderLink">
        <xsl:attribute name="href"><xsl:value-of select="@logoutlink"/></xsl:attribute>
        <xsl:if test="@logouttarget">
          <xsl:attribute name="target"><xsl:value-of select="@logouttarget"/></xsl:attribute>
        </xsl:if>
        <xsl:choose>
          <xsl:when test="@usealttext='true'"><xsl:value-of select="$signout"/></xsl:when>
          <xsl:otherwise><xsl:value-of select="$logout"/></xsl:otherwise>
        </xsl:choose>
      </a>
      <xsl:if test="$CUESSTYLEVERSION &lt; 60">
        <span class="cuesHeaderDivider">|</span>
      </xsl:if>
    </xsl:if>
    <a class="cuesHeaderLink">
      <xsl:attribute name="href">
        <xsl:call-template name="escapeOnclick"><xsl:with-param name="stringIn" select="@aboutlink"/></xsl:call-template>
      </xsl:attribute>
      <xsl:if test="@abouttarget">
        <xsl:attribute name="target"><xsl:value-of select="@abouttarget"/></xsl:attribute>
      </xsl:if>
      <xsl:value-of select="$about"/>
    </a>
    <xsl:if test="@helplink">
      <xsl:if test="$CUESSTYLEVERSION &lt; 60">
        <span class="cuesHeaderDivider">|</span>
      </xsl:if>
      <a class="cuesHeaderLink">
        <xsl:attribute name="href">
          <xsl:call-template name="escapeOnclick"><xsl:with-param name="stringIn" select="@helplink"/></xsl:call-template>
        </xsl:attribute>
        <xsl:if test="@helptarget">
          <xsl:attribute name="target"><xsl:value-of select="@helptarget"/></xsl:attribute>
        </xsl:if>
        <xsl:value-of select="$help"/>
      </a>
    </xsl:if>
  </xsl:if>
</xsl:template>
<xsl:template match="cues:pageheadernavitem">
  <option>
    <xsl:if test="@selected = 'true'">
      <xsl:attribute name="selected">true</xsl:attribute>
    </xsl:if>
    <xsl:if test="@value">
      <xsl:attribute name="value"><xsl:value-of select="@value"/></xsl:attribute>
    </xsl:if>
    <xsl:value-of select="."/>
  </option>
</xsl:template>
<xsl:template match="cues:pageheadernavitem" mode="appswitcher">
  <li class="cuesNowrap">
    <a onblur="return cuesButtonMenuOnblurHandler(this, event)" 
       onfocus="return cuesButtonMenuOnfocusHandler(this, event)">
      <xsl:attribute name="class">
        <xsl:text>cuesAppSwitcherMenu</xsl:text>
        <xsl:if test="@selected = 'true'">
          <xsl:text>Active</xsl:text>
        </xsl:if>
      </xsl:attribute>
      <xsl:attribute name="href"><xsl:value-of select="@value"/></xsl:attribute>
      <xsl:value-of select="."/>
    </a>
  </li>
</xsl:template>
<xsl:template match="cues:pageheaderitem[@onclick]">
  <a>
    <xsl:if test="@tooltip">
      <xsl:attribute name="title">      
        <xsl:call-template name="lookup">
          <xsl:with-param name="key" select="@tooltip"/>
          <xsl:with-param name="keyed" select="@tooltipaskey"/>
          <xsl:with-param name="locale" select="../@setLocale"/>
        </xsl:call-template>
      </xsl:attribute>
    </xsl:if>
    <xsl:attribute name="href">
      <xsl:call-template name="escapeOnclick"><xsl:with-param name="stringIn" select="@onclick"/></xsl:call-template>
    </xsl:attribute>
    <xsl:attribute name="class">cuesHeaderLink<xsl:if test="@bold = 'true'">Bold</xsl:if></xsl:attribute>
    <xsl:if test="@target">
      <xsl:attribute name="target"><xsl:value-of select="@target"/></xsl:attribute>
    </xsl:if>
    <xsl:if test="@id">
      <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
    </xsl:if>
    <xsl:apply-templates/>
  </a>
  <xsl:if test="$CUESSTYLEVERSION &lt; 60">
    <span class="cuesHeaderDivider">|</span>
  </xsl:if>
</xsl:template>
<xsl:template match="cues:pageheaderitem">
  <span>
    <xsl:attribute name="class">cuesHeaderText<xsl:if test="@bold = 'true'">Bold</xsl:if></xsl:attribute>
    <xsl:if test="@id">
      <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
    </xsl:if>
    <xsl:apply-templates/>
  </span>
  <xsl:if test="$CUESSTYLEVERSION &lt; 60">
    <span class="cuesHeaderDivider">|</span>
  </xsl:if>
</xsl:template>

<xsl:template match="cues:pagination">
  <xsl:variable name="spacing">
    <xsl:choose>
      <xsl:when test="@spacing"><xsl:value-of select="@spacing"/></xsl:when>
      <xsl:otherwise>tight</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="virtualLeft">
    <xsl:choose>
      <xsl:when test="$RTL='1'">right</xsl:when>
      <xsl:otherwise>left</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="virtualRight">
    <xsl:choose>
      <xsl:when test="$RTL='1'">left</xsl:when>
      <xsl:otherwise>right</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="numAfter">
    <xsl:choose>
      <xsl:when test="@totalpages - @currentpage > 2">2</xsl:when>
      <xsl:otherwise><xsl:value-of select="@totalpages - @currentpage"/></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="numBefore">
    <xsl:value-of select="$maxPageLinks - 1 - $numAfter"/>
  </xsl:variable>
  <xsl:variable name="firstToShow">
    <xsl:choose>
      <xsl:when test="(@totalpages > $maxPageLinks) and (@currentpage - $numBefore > 1)">
        <xsl:value-of select="@currentpage - $numBefore"/>
      </xsl:when>
      <xsl:otherwise>1</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="lastToShow">
    <xsl:choose>
      <xsl:when test="@totalpages > $firstToShow + $maxPageLinks - 1">
        <xsl:value-of select="$firstToShow + $maxPageLinks - 1"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="@totalpages"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <span class="cuesPagination">
    <nobr>
      <xsl:if test="@firstitem and @lastitem and @totalitems and $spacing='tight'">
        <xsl:value-of select="@firstitem"/>
        <xsl:text>-</xsl:text>
        <xsl:value-of select="@lastitem"/>
        <xsl:text>&#160;</xsl:text>
        <xsl:value-of select="$of"/>
        <xsl:text>&#160;</xsl:text>
        <xsl:value-of select="@totalitems"/>
        <xsl:text>&#160;</xsl:text>
        <xsl:if test="$CUESSTYLEVERSION >= 60">
          <xsl:value-of select="$results"/>
          <xsl:text>&#160;&#160;&#160;</xsl:text>
        </xsl:if>
      </xsl:if>
      <xsl:if test="$spacing='fill'">
        <xsl:call-template name="starttag"/>
        <xsl:text>div style="float:</xsl:text><xsl:value-of select="$virtualRight"/><xsl:text>"</xsl:text>
        <xsl:call-template name="endtag"/>
      </xsl:if>
      <xsl:choose>
        <xsl:when test="$CUESSTYLEVERSION >= 60">
            <button class="cuesPaginationButton">
              <xsl:if test="@currentpage=1">
                <xsl:attribute name="disabled">true</xsl:attribute>
              </xsl:if>
              <xsl:attribute name="onclick"><xsl:text>icuesPage('</xsl:text><xsl:value-of select="@id"/><xsl:text>',-1,</xsl:text><xsl:value-of select="@currentpage"/><xsl:text>)</xsl:text></xsl:attribute>
              <img border="0">
                <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/Previous</xsl:text><xsl:if test="@currentpage='1'"><xsl:text>-D</xsl:text></xsl:if><xsl:text>.gif</xsl:text></xsl:attribute>
                <xsl:attribute name="title"><xsl:value-of select="$previous"/></xsl:attribute>
                <xsl:attribute name="alt"><xsl:value-of select="$previous"/></xsl:attribute>
              </img>
            </button>
          <xsl:text>&#160;&#160;</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:choose>
            <xsl:when test="@currentpage=1">
              <span class="disabledPageLink"><xsl:value-of select="$previous"/></span>
            </xsl:when>
            <xsl:otherwise>
              <a class="enabledPageLink">
                <xsl:attribute name="href"><xsl:text>javascript:icuesPage('</xsl:text><xsl:value-of select="@id"/><xsl:text>',-1,</xsl:text><xsl:value-of select="@currentpage"/><xsl:text>)</xsl:text></xsl:attribute>
                <xsl:value-of select="$previous"/>
              </a>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:text>&#160;|&#160;</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:if test="@currentpage>1">
        <a class="enabledPageLink">
          <xsl:attribute name="href"><xsl:text>javascript:icuesPage('</xsl:text><xsl:value-of select="@id"/><xsl:text>',0,</xsl:text><xsl:value-of select="$firstToShow"/><xsl:text>)</xsl:text></xsl:attribute>
          <xsl:if test="not($firstToShow=1)">
            <xsl:text>...</xsl:text>
          </xsl:if>
          <xsl:value-of select="$firstToShow"/>
        </a>
        <span id="cuesRTLgap">&#160;</span>
      </xsl:if>
      <xsl:call-template name="pagination.before">
        <xsl:with-param name="index"><xsl:value-of select="$firstToShow + 1"/></xsl:with-param>
        <xsl:with-param name="limit"><xsl:value-of select="@currentpage"/></xsl:with-param>
        <xsl:with-param name="id"><xsl:value-of select="@id"/></xsl:with-param>
      </xsl:call-template>
      <span class="activePage"><xsl:value-of select="@currentpage"/></span>      
      <xsl:call-template name="pagination.after">
        <xsl:with-param name="index"><xsl:value-of select="@currentpage + 1"/></xsl:with-param>
        <xsl:with-param name="limit"><xsl:value-of select="$lastToShow"/></xsl:with-param>
        <xsl:with-param name="id"><xsl:value-of select="@id"/></xsl:with-param>
      </xsl:call-template>
      <xsl:if test="@currentpage &lt; $lastToShow">
        <span id="cuesRTLgap">&#160;</span>
        <a class="enabledPageLink">
          <xsl:attribute name="href"><xsl:text>javascript:icuesPage('</xsl:text><xsl:value-of select="@id"/><xsl:text>',0,</xsl:text><xsl:value-of select="$lastToShow"/><xsl:text>)</xsl:text></xsl:attribute>
          <xsl:value-of select="$lastToShow"/>
          <xsl:if test="not($lastToShow=@totalpages)">
            <xsl:text>...</xsl:text>
          </xsl:if>
        </a>
      </xsl:if>
      <xsl:choose>
        <xsl:when test="$CUESSTYLEVERSION >= 60">
          <xsl:text>&#160;&#160;</xsl:text>
          <button class="cuesPaginationButton">
            <xsl:if test="@currentpage=@totalpages">
              <xsl:attribute name="disabled">true</xsl:attribute>
            </xsl:if>
            <xsl:attribute name="onclick"><xsl:text>icuesPage('</xsl:text><xsl:value-of select="@id"/><xsl:text>',1,</xsl:text><xsl:value-of select="@currentpage"/><xsl:text>)</xsl:text></xsl:attribute>
            <img border="0">
              <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/Next</xsl:text><xsl:if test="@currentpage=@totalpages"><xsl:text>-D</xsl:text></xsl:if><xsl:text>.gif</xsl:text></xsl:attribute>
              <xsl:attribute name="title"><xsl:value-of select="$next"/></xsl:attribute>
              <xsl:attribute name="alt"><xsl:value-of select="$next"/></xsl:attribute>
            </img>
          </button>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>&#160;|&#160;</xsl:text>
          <xsl:choose>
            <xsl:when test="@currentpage=@totalpages">
              <span class="disabledPageLink"><xsl:value-of select="$next"/></span>
            </xsl:when>
            <xsl:otherwise>
              <a class="enabledPageLink">
                <xsl:attribute name="href"><xsl:text>javascript:icuesPage('</xsl:text><xsl:value-of select="@id"/><xsl:text>',1,</xsl:text><xsl:value-of select="@currentpage"/><xsl:text>)</xsl:text></xsl:attribute>
                <xsl:value-of select="$next"/>
              </a>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:otherwise>
      </xsl:choose>

      <xsl:if test="$spacing='fill'">
        <xsl:call-template name="starttag"/>
        <xsl:text>/div</xsl:text>
        <xsl:call-template name="endtag"/>
      </xsl:if>
      <xsl:if test="@firstitem and @lastitem and @totalitems and $spacing='fill'">
        <xsl:value-of select="@firstitem"/>
        <xsl:text>-</xsl:text>
        <xsl:value-of select="@lastitem"/>
        <xsl:text>&#160;</xsl:text>
        <xsl:value-of select="$of"/>
        <xsl:text>&#160;</xsl:text>
        <xsl:value-of select="@totalitems"/>
        <xsl:text>&#160;</xsl:text>
        <xsl:if test="$CUESSTYLEVERSION >= 60">
          <xsl:value-of select="$results"/>
        </xsl:if>
      </xsl:if>
    </nobr>
  </span>
</xsl:template>
<xsl:template name="pagination.before">
  <xsl:param name="index"/>
  <xsl:param name="limit"/>
  <xsl:param name="id"/>
  <xsl:if test="$index &lt; $limit">
    <a class="enabledPageLink">
      <xsl:attribute name="href"><xsl:text>javascript:icuesPage('</xsl:text><xsl:value-of select="$id"/><xsl:text>',0,</xsl:text><xsl:value-of select="$index"/><xsl:text>)</xsl:text></xsl:attribute>
      <xsl:value-of select="$index"/>
    </a>
    <span id="cuesRTLgap">&#160;</span>
    <xsl:call-template name="pagination.before">
      <xsl:with-param name="index"><xsl:value-of select="$index + 1"/></xsl:with-param>
      <xsl:with-param name="limit"><xsl:value-of select="$limit"/></xsl:with-param>
      <xsl:with-param name="id"><xsl:value-of select="$id"/></xsl:with-param>
    </xsl:call-template>
  </xsl:if>
</xsl:template>
<xsl:template name="pagination.after">
  <xsl:param name="index"/>
  <xsl:param name="limit"/>
  <xsl:param name="id"/>
  <xsl:if test="$index &lt; $limit">
    <span id="cuesRTLgap">&#160;</span>
    <a class="enabledPageLink">
      <xsl:attribute name="href"><xsl:text>javascript:icuesPage('</xsl:text><xsl:value-of select="$id"/><xsl:text>',0,</xsl:text><xsl:value-of select="$index"/><xsl:text>)</xsl:text></xsl:attribute>
      <xsl:value-of select="$index"/>
    </a>
    <xsl:call-template name="pagination.after">
      <xsl:with-param name="index"><xsl:value-of select="$index + 1"/></xsl:with-param>
      <xsl:with-param name="limit"><xsl:value-of select="$limit"/></xsl:with-param>
      <xsl:with-param name="id"><xsl:value-of select="$id"/></xsl:with-param>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

<xsl:template match="cues:pane"> 
  <xsl:variable name="height">
    <xsl:choose>
      <xsl:when test="@height"><xsl:value-of select="@height"/></xsl:when>
      <xsl:otherwise>100</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <table border="0" cellspacing="0" class="cuesPaneTitleBg">
    <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
    <xsl:choose>
      <xsl:when test="@title">
        <xsl:variable name="title">
          <xsl:call-template name="lookup">
            <xsl:with-param name="key" select="@title"/>
            <xsl:with-param name="keyed" select="@titleaskey"/>
            <xsl:with-param name="locale" select="@setLocale"/>
          </xsl:call-template>
        </xsl:variable>
        <tr>
          <td class="cuesPaneTitle" width="100%">
            <nobr>
              <xsl:if test="@icon">
                <img>
                  <xsl:attribute name="alt"><xsl:value-of select="$title"/></xsl:attribute>
                  <xsl:attribute name="title"><xsl:value-of select="$title"/></xsl:attribute>
                  <xsl:attribute name="src"><xsl:value-of select="@icon"/></xsl:attribute>
                </img>
                <xsl:text>&#160;</xsl:text>
              </xsl:if>
              <xsl:value-of select="$title"/>
            </nobr>
          </td>
          <td>
            <xsl:attribute name="id"><xsl:text>paging_</xsl:text><xsl:value-of select="@id"/></xsl:attribute>
            <xsl:text>&#160;</xsl:text>
            <xsl:apply-templates select="cues:panepagecontrols[@group='rowsper']"/>
          </td>
        </tr>
      </xsl:when>
      <xsl:otherwise>
        <tr style="line-height:1px">
          <td width="100%">&#160;</td>
          <td>
            <xsl:attribute name="id"><xsl:text>paging_</xsl:text><xsl:value-of select="@id"/></xsl:attribute>
            <xsl:text>&#160;</xsl:text>
            <xsl:apply-templates select="cues:panepagecontrols[@group='rowsper']"/>
          </td>
        </tr>
      </xsl:otherwise>
    </xsl:choose>
    <tr>
      <td colspan="2">
        <div class="cuesPaneContainer">
          <xsl:attribute name="style"><xsl:text>height:</xsl:text><xsl:value-of select="$height"/><xsl:text>;</xsl:text></xsl:attribute>
          <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>_scroller</xsl:text></xsl:attribute>
          <xsl:apply-templates select="*[local-name(.)!='panefooter'][local-name(.)!='panepagecontrols']"/>
        </div>
      </td>
    </tr>
    <xsl:apply-templates select="cues:panefooter"/>
  </table>
</xsl:template>
<xsl:template match="cues:panefooter"> 
  <xsl:apply-templates/>
</xsl:template>
<xsl:template match="cues:panepagecontrols[@group='paging']"> 
  <table cellpadding="0" cellspacing="0" class="cuesTablePagingGoto">
    <tr>
      <td><xsl:value-of select="$page"/>&#160;</td>
      <td>
        <input style="text-align:right" type="text" size="3">
          <xsl:attribute name="id">activepage_<xsl:value-of select="../@id"/></xsl:attribute>
          <xsl:attribute name="value"><xsl:value-of select="@currentpage"/></xsl:attribute>
          <xsl:attribute name="onkeypress"><xsl:text>return cuesPagingTableGoToHandler(event,this,'</xsl:text><xsl:value-of select="../@id"/><xsl:text>','</xsl:text><xsl:value-of select="@rowsperpage"/><xsl:text>')</xsl:text></xsl:attribute>
        </input>
      </td>
      <td>
        <xsl:text>&#160;</xsl:text>
        <xsl:value-of select="$of"/>
        <xsl:text>&#160;</xsl:text>
        <span>
          <xsl:attribute name="id">totalpages_<xsl:value-of select="../@id"/></xsl:attribute>
          <xsl:value-of select="@totalpages"/>
        </span>
        <xsl:text>&#160;</xsl:text>
      </td>
      <td>
        <button type="button" class="cuesTablePagingButton">
          <xsl:attribute name="id">firstpage_<xsl:value-of select="../@id"/></xsl:attribute>
          <xsl:attribute name="onclick"><xsl:text>cuesPageTable('</xsl:text><xsl:value-of select="../@id"/><xsl:text>',1,-2,'</xsl:text><xsl:value-of select="@rowsperpage"/><xsl:text>')</xsl:text></xsl:attribute>
          <xsl:if test="@currentpage=1"><xsl:attribute name="disabled">true</xsl:attribute></xsl:if>
          <img border="0">
            <xsl:attribute name="title"><xsl:value-of select="$firstpage"/></xsl:attribute>
            <xsl:attribute name="alt"><xsl:value-of select="$firstpage"/></xsl:attribute>
            <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/First</xsl:text><xsl:if test="@currentpage='1'"><xsl:text>-D</xsl:text></xsl:if><xsl:text>.gif</xsl:text></xsl:attribute>
          </img>
        </button>
        <xsl:text>&#160;</xsl:text>
        <button type="button" class="cuesTablePagingButton">
          <xsl:attribute name="id">prevpage_<xsl:value-of select="../@id"/></xsl:attribute>
          <xsl:attribute name="onclick"><xsl:text>cuesPageTable('</xsl:text><xsl:value-of select="../@id"/><xsl:text>',</xsl:text><xsl:value-of select="@currentpage"/><xsl:text>,-1,'</xsl:text><xsl:value-of select="@rowsperpage"/><xsl:text>')</xsl:text></xsl:attribute>
          <xsl:if test="@currentpage=1"><xsl:attribute name="disabled">true</xsl:attribute></xsl:if>
          <img border="0">
            <xsl:attribute name="title"><xsl:value-of select="$previouspage"/></xsl:attribute>
            <xsl:attribute name="alt"><xsl:value-of select="$previouspage"/></xsl:attribute>
            <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/Previous</xsl:text><xsl:if test="@currentpage='1'"><xsl:text>-D</xsl:text></xsl:if><xsl:text>.gif</xsl:text></xsl:attribute>
          </img>
        </button>
        <xsl:text>&#160;</xsl:text>
        <button type="button" class="cuesTablePagingButton">
          <xsl:attribute name="id">nextpage_<xsl:value-of select="../@id"/></xsl:attribute>
          <xsl:attribute name="onclick"><xsl:text>cuesPageTable('</xsl:text><xsl:value-of select="../@id"/><xsl:text>',</xsl:text><xsl:value-of select="@currentpage"/><xsl:text>,1,'</xsl:text><xsl:value-of select="@rowsperpage"/><xsl:text>')</xsl:text></xsl:attribute>
          <xsl:if test="@currentpage=@totalpages"><xsl:attribute name="disabled">true</xsl:attribute></xsl:if>
          <img border="0">
            <xsl:attribute name="title"><xsl:value-of select="$nextpage"/></xsl:attribute>
            <xsl:attribute name="alt"><xsl:value-of select="$nextpage"/></xsl:attribute>
            <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/Next</xsl:text><xsl:if test="@currentpage=@totalpages"><xsl:text>-D</xsl:text></xsl:if><xsl:text>.gif</xsl:text></xsl:attribute>
          </img>
        </button>
        <xsl:text>&#160;</xsl:text>
        <button type="button" class="cuesTablePagingButton">
          <xsl:attribute name="id">lastpage_<xsl:value-of select="../@id"/></xsl:attribute>
          <xsl:attribute name="onclick"><xsl:text>cuesPageTable('</xsl:text><xsl:value-of select="../@id"/><xsl:text>',</xsl:text><xsl:value-of select="@totalpages"/><xsl:text>,2,'</xsl:text><xsl:value-of select="@rowsperpage"/><xsl:text>')</xsl:text></xsl:attribute>
          <xsl:if test="@currentpage=@totalpages"><xsl:attribute name="disabled">true</xsl:attribute></xsl:if>
          <img border="0">
            <xsl:attribute name="title"><xsl:value-of select="$lastpage"/></xsl:attribute>
            <xsl:attribute name="alt"><xsl:value-of select="$lastpage"/></xsl:attribute>
            <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/Last</xsl:text><xsl:if test="@currentpage=@totalpages"><xsl:text>-D</xsl:text></xsl:if><xsl:text>.gif</xsl:text></xsl:attribute>
          </img>
        </button>
      </td>
    </tr>
  </table>
</xsl:template>
<xsl:template match="cues:panepagecontrols[@group='rowsper']">
  <xsl:variable name="ownerid"><xsl:value-of select="ancestor::cues:pane/@id"/></xsl:variable>
  <nobr>
    <span class="cuesTablePagingItems">
      <xsl:value-of select="$items"/>
      <xsl:text>&#160;</xsl:text>
      <span>
        <xsl:attribute name="id"><xsl:text>firstitem_</xsl:text><xsl:value-of select="$ownerid"/></xsl:attribute>
        <xsl:value-of select="@firstitem"/>
      </span>
      <xsl:text>-</xsl:text>
      <span>
        <xsl:attribute name="id"><xsl:text>lastitem_</xsl:text><xsl:value-of select="$ownerid"/></xsl:attribute>
        <xsl:value-of select="@lastitem"/>
      </span>
      <xsl:text>&#160;</xsl:text>
      <xsl:value-of select="$of"/>
      <xsl:text>&#160;</xsl:text>
      <span>
        <xsl:attribute name="id"><xsl:text>totalitems_</xsl:text><xsl:value-of select="$ownerid"/></xsl:attribute>
        <xsl:value-of select="@totalitems"/>
      </span>
    </span>
    <xsl:text>&#160;&#160;</xsl:text>
    <span class="cuesTablePagingRowsPer">
    <xsl:text>|&#160;&#160;</xsl:text>
      <xsl:value-of select="$rowsperpage"/>
    <xsl:text>:&#160;</xsl:text>
      <select>
        <xsl:attribute name="id"><xsl:value-of select="$ownerid"/><xsl:text>_rowsper</xsl:text></xsl:attribute>
        <option value="10">
          <xsl:if test="@rowsperpage='10'"><xsl:attribute name="selected">test</xsl:attribute></xsl:if>
          <xsl:text>10</xsl:text></option>
        <option value="25">
          <xsl:if test="@rowsperpage='25'"><xsl:attribute name="selected">test</xsl:attribute></xsl:if>
          <xsl:text>25</xsl:text></option>
        <option value="50">
          <xsl:if test="@rowsperpage='50'"><xsl:attribute name="selected">test</xsl:attribute></xsl:if>
          <xsl:text>50</xsl:text></option>
        <option value="100">
          <xsl:if test="@rowsperpage='100'"><xsl:attribute name="selected">test</xsl:attribute></xsl:if>
          <xsl:text>100</xsl:text></option>
        <xsl:if test="@appmaxrows">
          <option>
            <xsl:attribute name="value"><xsl:value-of select="@appmaxrows"/></xsl:attribute>
            <xsl:if test="@rowsperpage=@appmaxrows"><xsl:attribute name="selected">test</xsl:attribute></xsl:if>
            <xsl:value-of select="@appmaxrows"/></option>
        </xsl:if>
        <xsl:choose>
          <xsl:when test="@allowallrows='false'"></xsl:when>
          <xsl:otherwise>
            <option value="all">
              <xsl:if test="@rowsperpage='all'"><xsl:attribute name="selected">test</xsl:attribute></xsl:if>
              <xsl:value-of select="$all"/></option>
          </xsl:otherwise>
        </xsl:choose>
      </select>
      <button type="button">
        <xsl:attribute name="id"><xsl:value-of select="$ownerid"/><xsl:text>_rowsper_action</xsl:text></xsl:attribute>
        <xsl:attribute name="onclick"><xsl:text>cuesPagingTableRowsPerHandler(event,'</xsl:text><xsl:value-of select="$ownerid"/><xsl:text>','</xsl:text><xsl:value-of select="@currentpage"/><xsl:text>')</xsl:text></xsl:attribute>
        <xsl:value-of select="$go"/>
      </button>
    </span>
  </nobr>
</xsl:template>


<xsl:template name="passwordchange61"> 
  <xsl:variable name="virtualRight">
    <xsl:choose>
      <xsl:when test="$RTL='1'">left</xsl:when>
      <xsl:otherwise>right</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <table class="cuesLoginContainer" border="0" cellpadding="0" cellspacing="0">
    <tr height="100%">
      <td valign="top">
        <div id="cuesLoginProductSection" class="cuesLoginProductSection"><br class="cuesLoginClear" />
          <table>            
            <tr>
              <td valign="bottom" style="padding-bottom:5px">
                <img onload="cuesFixPNG(null,this)" class="cuesLoginLogo" align="absmiddle">
                  <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/<xsl:value-of select="$CUESHEADERIMAGE"/></xsl:attribute>
                  <xsl:attribute name="title"><xsl:value-of select="$companylogo"/></xsl:attribute>
                  <xsl:attribute name="alt"><xsl:value-of select="$companylogo"/></xsl:attribute>
                </img>
              </td>
              <td valign="bottom">
                <xsl:apply-templates select="cues:passwordchangeproduct"/>
              </td>
            </tr>
            <tr>
              <td>&#160;</td>
              <td>
                <xsl:apply-templates select="cues:passwordchangeversion"/>
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <br/>
                <xsl:apply-templates select="cues:passwordchangestatus"/>
              </td>
            </tr>
          </table>
        </div>
      </td>
      <td valign="top">
        <div id="cuesLoginFieldsSection" class="cuesLoginFieldsSection"><br class="cuesLoginClear" />
          <table width="10px">
            <tr>
              <td><xsl:text>&#160;</xsl:text></td>
              <td>
                <xsl:apply-templates select="cues:passwordchangeerror"/>
              </td>
            </tr>
            <tr>
              <td class="cuesLoginField">
                <xsl:attribute name="align"><xsl:value-of select="$virtualRight"/></xsl:attribute>
                <label>
                  <xsl:attribute name="for"><xsl:value-of select="@currentpasswordid"/></xsl:attribute>
                  <nobr><xsl:value-of select="$currentpasswordprompt"/>:</nobr>
                </label>
              </td>
              <td>
                <input type="password" size="10" autocomplete="off">
                  <xsl:attribute name="name"><xsl:value-of select="@currentpasswordid"/></xsl:attribute>
                  <xsl:attribute name="id"><xsl:value-of select="@currentpasswordid"/></xsl:attribute>
                </input>
              </td>
            </tr>
            <tr>
              <td class="cuesLoginField">
                <xsl:attribute name="align"><xsl:value-of select="$virtualRight"/></xsl:attribute>
                <label>
                  <xsl:attribute name="for"><xsl:value-of select="@newpasswordid"/></xsl:attribute>
                  <nobr><xsl:value-of select="$newpasswordprompt"/>:</nobr>
                </label>
              </td>
              <td>
                <input type="password" size="10" autocomplete="off">
                  <xsl:attribute name="name"><xsl:value-of select="@newpasswordid"/></xsl:attribute>
                  <xsl:attribute name="id"><xsl:value-of select="@newpasswordid"/></xsl:attribute>
                </input>
              </td>
            </tr>
            <tr>
              <td class="cuesLoginField">
                <xsl:attribute name="align"><xsl:value-of select="$virtualRight"/></xsl:attribute>
                <label>
                  <xsl:attribute name="for"><xsl:value-of select="@confirmpasswordid"/></xsl:attribute>
                  <nobr><xsl:value-of select="$confirmpasswordprompt"/>:</nobr>
                </label>
              </td>
              <td>
                <input type="password" size="10" autocomplete="off">
                  <xsl:attribute name="name"><xsl:value-of select="@confirmpasswordid"/></xsl:attribute>
                  <xsl:attribute name="id"><xsl:value-of select="@confirmpasswordid"/></xsl:attribute>
                </input>
              </td>
            </tr>
            <tr>
              <td colspan="2" class="cuesBrSmall">&#160;</td>
            </tr>
            <tr>
              <td>&#160;</td>
              <td nowrap="yes">
                <button id="cuesLoginSubmitButton" type="submit" class="cuesLoginButton">
                  <xsl:value-of select="$save"/>
                </button>
                <xsl:text>&#160;&#160;</xsl:text>
                <button id="cuesResetButton" type="reset" class="cuesLoginButton" onclick="cuesResetFormFocus(this)">
                  <xsl:value-of select="$reset"/>
                </button>
                <xsl:text>&#160;&#160;</xsl:text>
                <button id="cuesCancelButton" type="button" class="cuesLoginButton">
                  <xsl:attribute name="onclick"><xsl:value-of select="@oncancel"/></xsl:attribute>
                  <xsl:value-of select="$cancel"/>
                </button>
              </td>
            </tr>
          </table>
        </div>
      </td>
    </tr>
    <tr>
      <td valign="bottom" colspan="2">
        <div id="cuesLoginInfoSection" class="cuesLoginInfoSection"><br class="cuesLoginClear" />
          <xsl:apply-templates select="cues:passwordchangecopyright"/>
        </div>
      </td>
    </tr>
  </table>
  <script>
    if (document.addEventListener)
      window.addEventListener('resize', icuesLoginLayout, false);
    else if (document.attachEvent)
      window.attachEvent('onresize', icuesLoginLayout);
    icuesLoginLayout();  
  </script>
</xsl:template>
<xsl:template name="passwordchange60"> 
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td class="cuesLoginMainLeft" style="padding-left:18px" width="100%">
        <xsl:apply-templates select="cues:passwordchangeproduct"/>
        <br/>
        <xsl:apply-templates select="cues:passwordchangeversion"/>
      </td>
      <td class="cuesLoginMainLeft" align="right" style="padding-left:64px;padding-right:18px;padding-top:18px;padding-bottom:18px;">
        <table>
          <tr>
            <td class="cuesLoginField">
              <label>
                <xsl:attribute name="for"><xsl:value-of select="@currentpasswordid"/></xsl:attribute>
                <nobr>Enter Current Password:</nobr>
              </label>
            </td>
            <td>
              <input type="password" size="10" autocomplete="off">
                <xsl:attribute name="name"><xsl:value-of select="@currentpasswordid"/></xsl:attribute>
                <xsl:attribute name="id"><xsl:value-of select="@currentpasswordid"/></xsl:attribute>
              </input>
            </td>
          </tr>
          <tr>
            <td class="cuesLoginField">
              <label>
                <xsl:attribute name="for"><xsl:value-of select="@newpasswordid"/></xsl:attribute>
                <nobr>Enter New Password:</nobr>
              </label>
            </td>
            <td>
              <input type="password" size="10" autocomplete="off">
                <xsl:attribute name="name"><xsl:value-of select="@newpasswordid"/></xsl:attribute>
                <xsl:attribute name="id"><xsl:value-of select="@newpasswordid"/></xsl:attribute>
              </input>
            </td>
          </tr>
          <tr>
            <td class="cuesLoginField">
              <label>
                <xsl:attribute name="for"><xsl:value-of select="@confirmpasswordid"/></xsl:attribute>
                <nobr>Re-Enter New Password:</nobr>
              </label>
            </td>
            <td>
              <input type="password" size="10" autocomplete="off">
                <xsl:attribute name="name"><xsl:value-of select="@confirmpasswordid"/></xsl:attribute>
                <xsl:attribute name="id"><xsl:value-of select="@confirmpasswordid"/></xsl:attribute>
              </input>
            </td>
          </tr>
          <tr><td colspan="2" class="cuesLoginGap">&#160;</td></tr>          
          <tr>
            <td class="cuesLoginMainLeft" align="right" colspan="2">
              <button id="cuesLoginSubmitButton" type="submit" class="cuesLoginButton">
                <xsl:value-of select="$save"/>
              </button>
              <xsl:text>&#160;&#160;</xsl:text>
              <button id="cuesResetButton" type="reset" class="cuesLoginButton" onclick="cuesResetFormFocus(this)">
                <xsl:value-of select="$reset"/>
              </button>
              <xsl:text>&#160;&#160;</xsl:text>
              <button id="cuesCancelButton" type="button" class="cuesLoginButton">
                <xsl:attribute name="onclick"><xsl:value-of select="@oncancel"/></xsl:attribute>
                <xsl:value-of select="$cancel"/>
              </button>
            </td>
          </tr>
        </table>
      </td>
      <xsl:if test="$CUESSTYLEVERSION &lt; 60">
        <td valign="top" class="cuesLoginMainRight">
          <img alt="" title="">
            <xsl:attribute name="src"><xsl:value-of select="@image"/></xsl:attribute>
          </img>
        </td>
      </xsl:if>
    </tr>
    <tr>
      <td colspan="2" class="cuesLoginFooterLeft" style="text-align:center;">
        <div id="cuesPasswordChangeMessage">&#160;</div>
      </td>
      <xsl:if test="$CUESSTYLEVERSION &lt; 60">
        <td class="cuesLoginFooterRight">&#160;</td>
      </xsl:if>
    </tr>
  </table>
</xsl:template>
<xsl:template match="cues:passwordchange"> 
  <form id="cuesPasswordChangeForm">
    <xsl:if test="@method">
      <xsl:attribute name="method"><xsl:value-of select="@method"/></xsl:attribute>
    </xsl:if>
    <xsl:if test="@onsubmit">
      <xsl:attribute name="onsubmit"><xsl:value-of select="@onsubmit"/></xsl:attribute>
    </xsl:if>
    <xsl:attribute name="action"><xsl:value-of select="@action"/></xsl:attribute>
    <xsl:choose>
      <xsl:when test="$CUESSTYLEVERSION >= 61">
        <xsl:call-template name="passwordchange61"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="passwordchange60"/>
      </xsl:otherwise>
    </xsl:choose>
  </form>
  <script><xsl:text>try{document.getElementById('</xsl:text><xsl:value-of select="@currentpasswordid"/><xsl:text>').focus();}catch(e){}</xsl:text></script>
</xsl:template>
<xsl:template match="cues:passwordchangeproduct"> 
  <div class="cuesLoginProductName">
    <xsl:apply-templates/>
  </div>
</xsl:template>
<xsl:template match="cues:passwordchangeversion"> 
  <div class="cuesLoginVersionInfo">
    <xsl:apply-templates/>
  </div>
</xsl:template>
<xsl:template match="cues:passwordchangestatus"> 
  <div id="cuesLoginStatus" class="cuesLoginStatus">
    <xsl:apply-templates/>
  </div>
  <xsl:if test="$CUESSTYLEVERSION >= 61">
    <script>
      if(cuesDrawnShape==null)cuesDrawnShape=new icuesDrawnShape();
      cuesDrawnShape.makeContainer("cuesLoginStatus","#ffffff","67%");
    </script>
  </xsl:if>
</xsl:template>
<xsl:template match="cues:passwordchangeerror"> 
  <div>
    <xsl:attribute name="class">
      <xsl:choose>
        <xsl:when test="$ISIE='1'"><xsl:text>cuesErrorText cuesLoginErrorTextIE</xsl:text></xsl:when>
        <xsl:otherwise><xsl:text>cuesErrorText cuesLoginErrorTextFF</xsl:text></xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <div class="cuesLoginErrorBox">
      <xsl:attribute name="id"><xsl:value-of select="@id"/>_err</xsl:attribute>
      <xsl:apply-templates/>
    </div>
    <script>
      <xsl:text>if(cuesDrawnShape==null)cuesDrawnShape=new icuesDrawnShape();</xsl:text>
      <xsl:text>cuesDrawnShape.makeContainer('</xsl:text><xsl:value-of select="@id"/><xsl:text>_err','#ffffff','67%');</xsl:text>
    </script>
  </div>
</xsl:template>
<xsl:template match="cues:passwordchangecopyright"> 
  <div class="cuesLoginCopyright">
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="cues:popupmenu">
  <div style="display:none;position:absolute;">
    <xsl:attribute name="id"><xsl:value-of select="@id"/>menu</xsl:attribute>
    <ul>
      <xsl:attribute name="class">
        <xsl:text>cuesButtonMenu</xsl:text>
        <xsl:if test="$ISIE='1'"><xsl:text> cuesButtonMenuIE</xsl:text></xsl:if>
        <xsl:choose>
          <xsl:when test="$RTL='1'"><xsl:text> cuesButtonMenuRTL</xsl:text></xsl:when>
          <xsl:otherwise><xsl:text> cuesButtonMenuLTR</xsl:text></xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <xsl:apply-templates select="cues:menuitem"/>
    </ul>
  </div>
</xsl:template>

<xsl:template match="cues:primarytabset">
  <script>if(cuesDrawnShape==null)cuesDrawnShape=new icuesDrawnShape();</script>
  <div id="cuesPrimaryTabset" class="cuesPrimaryTabset">
    <table border="0" cellspacing="0" cellpadding="0">
      <tbody>
        <tr>
          <xsl:apply-templates select="cues:primarytab"/>
          <td id="cuesPrimaryTabsetClip" class="cuesPrimaryTabCaptionInactive" style="display:none;">
            <xsl:attribute name="title"><xsl:value-of select="$expandwindow"/></xsl:attribute>
            <xsl:text>&gt;&gt;</xsl:text>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
  <script>
    cuesDrawnShape.makePrimaryTabset("cuesPrimaryTabset");
    <xsl:for-each select="cues:primarytab">
      <xsl:variable name="active">
        <xsl:choose>
          <xsl:when test="@active"><xsl:value-of select="@active"/></xsl:when>
          <xsl:otherwise>false</xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:text>cuesDrawnShape.makePrimaryTab("cuesPrimaryTabset",</xsl:text><xsl:value-of select="count(preceding-sibling::cues:primarytab)"/><xsl:text>,</xsl:text><xsl:value-of select="$active"/><xsl:text>);</xsl:text>
    </xsl:for-each>
    icuesTilePrimaryTabs(null);
  </script>
</xsl:template>

<xsl:template match="cues:primarytab">
  <xsl:variable name="tabindex"><xsl:value-of select="count(preceding-sibling::cues:primarytab)"/></xsl:variable>
  <xsl:variable name="active">
    <xsl:choose>
      <xsl:when test="@active"><xsl:value-of select="@active"/></xsl:when>
      <xsl:otherwise>false</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <td nowrap="yes">
    <div>
      <xsl:attribute name="class">
        <xsl:choose>
          <xsl:when test="$active='true'">cuesPrimaryTab cuesPrimaryTabCaptionActive</xsl:when>
          <xsl:otherwise>cuesPrimaryTab cuesPrimaryTabCaptionInactive</xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <xsl:attribute name="id">
        <xsl:text>cuesPrimaryTabset_</xsl:text><xsl:value-of select="$tabindex"/><xsl:text>_tab</xsl:text>
      </xsl:attribute>
      <xsl:if test="@id">
        <xsl:attribute name="appid">
          <xsl:value-of select="@id"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:attribute name="onclick">
        <xsl:text>return cuesDrawnShape.togglePrimaryTab('cuesPrimaryTabset',</xsl:text><xsl:value-of select="$tabindex"/><xsl:text>,true,event)</xsl:text>
      </xsl:attribute>
      <xsl:attribute name="onmouseover">
        <xsl:text>return cuesDrawnShape.primarytabMouseover('cuesPrimaryTabset',</xsl:text><xsl:value-of select="$tabindex"/><xsl:text>)</xsl:text>
      </xsl:attribute>
      <xsl:attribute name="onmouseout">
        <xsl:text>return cuesDrawnShape.primarytabMouseout('cuesPrimaryTabset',</xsl:text><xsl:value-of select="$tabindex"/><xsl:text>)</xsl:text>
      </xsl:attribute>
      <div class="cuesPrimaryTabCaption">
        <a class="cuesPrimaryTabLink">
          <xsl:attribute name="id">
            <xsl:text>cuesid_cuesPrimaryTabset_</xsl:text><xsl:value-of select="$tabindex"/>
          </xsl:attribute>
          <xsl:attribute name="onfocus">
            <xsl:text>return cuesDrawnShape.primarytabMouseover('cuesPrimaryTabset',</xsl:text><xsl:value-of select="$tabindex"/><xsl:text>)</xsl:text>
          </xsl:attribute>
          <xsl:attribute name="onblur">
            <xsl:text>return cuesDrawnShape.primarytabMouseout('cuesPrimaryTabset',</xsl:text><xsl:value-of select="$tabindex"/><xsl:text>)</xsl:text>
          </xsl:attribute>
          <xsl:attribute name="onclick">
            <xsl:text>return cuesDrawnShape.togglePrimaryTab('cuesPrimaryTabset',</xsl:text><xsl:value-of select="$tabindex"/><xsl:text>,false,event)</xsl:text>
          </xsl:attribute>
          <xsl:attribute name="target"><xsl:value-of select="@target"/></xsl:attribute>
          <xsl:attribute name="href"><xsl:value-of select="@onclick"/></xsl:attribute>
          <span>
            <xsl:call-template name="lookup">
              <xsl:with-param name="key" select="@title"/>
              <xsl:with-param name="keyed" select="@titleaskey"/>
              <xsl:with-param name="locale" select="../@setLocale"/>
            </xsl:call-template>
          </span>
        </a>
      </div>
    </div>
  </td>
</xsl:template>

<xsl:template match="cues:progressbar">
  <center>
    <xsl:if test="@showpercentage='true'">
      <div>
        <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>.percent</xsl:text></xsl:attribute>
      0%
      </div>
    </xsl:if>
    <div class="cuesProgressBar">
      <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
      <div class="cuesProgressBarDeterminate">
        <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>.bar</xsl:text></xsl:attribute>
        &#160;
      </div>
    &#160;
    </div>
  </center>
</xsl:template>

<xsl:template match="cues:requiredfieldsnotice">
  <div class="cuesRequiredField">
    <img title="" alt="">
      <xsl:choose>
        <xsl:when test="$CUESSTYLEVERSION >= 60">
          <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/RequiredFieldT.gif</xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/required-fields.gif</xsl:attribute>
        </xsl:otherwise>
      </xsl:choose>
    </img>
  </div>
  <span class="cuesRequiredFieldsNotice"><xsl:text>&#160;=&#160;</xsl:text><xsl:value-of select="$msgRequiredFieldsNotice"/></span>
</xsl:template>
<xsl:template match="cues:requiredfield">
  <div class="cuesRequiredField">
    <xsl:choose>
      <xsl:when test="@required='false'"> 
        <span>&#160;</span>
      </xsl:when>
      <xsl:otherwise>
        <img alt="Required Field" title="Required Field">
          <xsl:if test="@id">
            <xsl:attribute name="id"><xsl:value-of select="@id"/>RequiredHint</xsl:attribute>
          </xsl:if>
          <xsl:choose>
            <xsl:when test="$CUESSTYLEVERSION >= 60">
              <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/RequiredFieldT.gif</xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
              <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/required-fields.gif</xsl:attribute>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:if test="@initial='false'">
            <xsl:attribute name="style">visibility:hidden</xsl:attribute>
          </xsl:if>
        </img>
      </xsl:otherwise>
    </xsl:choose>
  </div>
</xsl:template>


<xsl:template match="cues:tableselectionrules">
  <xsl:variable name="tableid"><xsl:value-of select="ancestor::cues:table/@id"/></xsl:variable>
  <xsl:variable name="upid"><xsl:value-of select="$tableid"/>_moveup</xsl:variable>
  <xsl:variable name="downid"><xsl:value-of select="$tableid"/>_movedown</xsl:variable>
  <xsl:variable name="toid"><xsl:value-of select="$tableid"/>_moveto</xsl:variable>
  <xsl:variable name="allids"><xsl:value-of select="$upid"/>,<xsl:value-of select="$downid"/>,<xsl:value-of select="$toid"/></xsl:variable>
  <script>
    <xsl:text>TableRowSelectionRules['</xsl:text><xsl:value-of select="$tableid"/><xsl:text>'] = new Array();</xsl:text>
    <xsl:if test="../cues:tablecontent[@reorderable='true']">
      <xsl:text>TableRowSelectionRules['</xsl:text><xsl:value-of select="$tableid"/><xsl:text>']['first.disable']='';</xsl:text>
      <xsl:text>TableRowSelectionRules['</xsl:text><xsl:value-of select="$tableid"/><xsl:text>']['last.disable']='';</xsl:text>
      <xsl:text>TableRowSelectionRules['</xsl:text><xsl:value-of select="$tableid"/><xsl:text>']['contiguous.enable']='';</xsl:text>
      <xsl:text>TableRowSelectionRules['</xsl:text><xsl:value-of select="$tableid"/><xsl:text>']['noncontiguous.disable']='';</xsl:text>
      <xsl:text>TableRowSelectionRules['</xsl:text><xsl:value-of select="$tableid"/><xsl:text>']['one.enable']='';</xsl:text>
      <xsl:text>TableRowSelectionRules['</xsl:text><xsl:value-of select="$tableid"/><xsl:text>']['none.disable']='';</xsl:text>
      <xsl:text>TableRowSelectionRules['</xsl:text><xsl:value-of select="$tableid"/><xsl:text>']['all.disable']='';</xsl:text>
    </xsl:if>  
    <xsl:apply-templates select="cues:selectionrule">
      <xsl:with-param name="id" select="$tableid"/>
      <xsl:with-param name="ruletype">TableRow</xsl:with-param>
    </xsl:apply-templates>
    <xsl:if test="../cues:tablecontent[@reorderable='true']">
      <xsl:text>TableRowSelectionRules['</xsl:text><xsl:value-of select="$tableid"/><xsl:text>']['first.disable']+=',</xsl:text><xsl:value-of select="$upid"/>';
      <xsl:text>TableRowSelectionRules['</xsl:text><xsl:value-of select="$tableid"/><xsl:text>']['last.disable']+=',</xsl:text><xsl:value-of select="$downid"/>';
      <xsl:text>TableRowSelectionRules['</xsl:text><xsl:value-of select="$tableid"/><xsl:text>']['contiguous.enable']+=',</xsl:text><xsl:value-of select="$allids"/>';
      <xsl:text>TableRowSelectionRules['</xsl:text><xsl:value-of select="$tableid"/><xsl:text>']['noncontiguous.disable']+=',</xsl:text><xsl:value-of select="$allids"/>';
      <xsl:text>TableRowSelectionRules['</xsl:text><xsl:value-of select="$tableid"/><xsl:text>']['one.enable']+=',</xsl:text><xsl:value-of select="$allids"/>';
      <xsl:text>TableRowSelectionRules['</xsl:text><xsl:value-of select="$tableid"/><xsl:text>']['none.disable']+=',</xsl:text><xsl:value-of select="$allids"/>';
      <xsl:text>TableRowSelectionRules['</xsl:text><xsl:value-of select="$tableid"/><xsl:text>']['all.disable']+=',</xsl:text><xsl:value-of select="$allids"/>';
    </xsl:if>  
  </script>
</xsl:template>

<xsl:template match="cues:transferboxselectionrules">
  <xsl:variable name="id"><xsl:value-of select="../@id"/></xsl:variable>
  <script>
    <xsl:text>TransferboxSelectionRules['</xsl:text><xsl:value-of select="$id"/><xsl:text>'] = new Array();</xsl:text>
    <xsl:apply-templates select="cues:selectionrule">
      <xsl:with-param name="id" select="$id"/>
      <xsl:with-param name="ruletype">Transferbox</xsl:with-param>
    </xsl:apply-templates>
  </script>
</xsl:template>
<xsl:template match="cues:selectionrule">
  <xsl:param name="id">foo</xsl:param>
  <xsl:param name="ruletype">foo</xsl:param>
  <xsl:if test="@enable">
    <xsl:value-of select="$ruletype"/><xsl:text>SelectionRules['</xsl:text><xsl:value-of select="$id"/><xsl:text>']['</xsl:text><xsl:value-of select="@state"/><xsl:text>.enable']='</xsl:text><xsl:value-of select="@enable"/><xsl:text>';</xsl:text>
  </xsl:if>
  <xsl:if test="@disable">
    <xsl:value-of select="$ruletype"/><xsl:text>SelectionRules['</xsl:text><xsl:value-of select="$id"/><xsl:text>']['</xsl:text><xsl:value-of select="@state"/><xsl:text>.disable']='</xsl:text><xsl:value-of select="@disable"/><xsl:text>';</xsl:text>
  </xsl:if>
  <xsl:if test="@check">
    <xsl:value-of select="$ruletype"/><xsl:text>SelectionRules['</xsl:text><xsl:value-of select="$id"/><xsl:text>']['</xsl:text><xsl:value-of select="@state"/><xsl:text>.check']='</xsl:text><xsl:value-of select="@check"/><xsl:text>';</xsl:text>
  </xsl:if>
  <xsl:if test="@uncheck">
    <xsl:value-of select="$ruletype"/><xsl:text>SelectionRules['</xsl:text><xsl:value-of select="$id"/><xsl:text>']['</xsl:text><xsl:value-of select="@state"/><xsl:text>.uncheck']='</xsl:text><xsl:value-of select="@uncheck"/><xsl:text>';</xsl:text>
  </xsl:if>
  <xsl:if test="@clear">
    <xsl:value-of select="$ruletype"/><xsl:text>SelectionRules['</xsl:text><xsl:value-of select="$id"/><xsl:text>']['</xsl:text><xsl:value-of select="@state"/><xsl:text>.clear']='</xsl:text><xsl:value-of select="@clear"/><xsl:text>';</xsl:text>
  </xsl:if>
</xsl:template>

<xsl:template match="cues:secondarytabset">
  <xsl:variable name="id">
    <xsl:choose>
      <xsl:when test="@id"><xsl:value-of select="@id"/></xsl:when>
      <xsl:otherwise>cuesSecondaryTabset</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <script>if(cuesDrawnShape==null)cuesDrawnShape=new icuesDrawnShape();</script>
  <div class="cuesSecondaryTabset">
    <xsl:attribute name="id"><xsl:value-of select="$id"/></xsl:attribute>
    <table border="0" cellspacing="0" cellpadding="0">
      <tbody>
        <tr>
          <xsl:apply-templates select="cues:secondarytab"/>
        </tr>
      </tbody>
    </table>
  </div>
  <script>
    <xsl:for-each select="cues:secondarytab">
      <xsl:variable name="active">
        <xsl:choose>
          <xsl:when test="@active"><xsl:value-of select="@active"/></xsl:when>
          <xsl:otherwise>false</xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:text>cuesDrawnShape.makeSecondaryTab("</xsl:text><xsl:value-of select="$id"/><xsl:text>",</xsl:text><xsl:value-of select="count(preceding-sibling::cues:secondarytab)"/><xsl:text>,</xsl:text><xsl:value-of select="$active"/><xsl:text>);</xsl:text>
    </xsl:for-each>
  </script>
</xsl:template>
<xsl:template match="cues:secondarytab">
  <xsl:variable name="tabindex"><xsl:value-of select="count(preceding-sibling::cues:secondarytab)"/></xsl:variable>
  <xsl:variable name="active">
    <xsl:choose>
      <xsl:when test="@active"><xsl:value-of select="@active"/></xsl:when>
      <xsl:otherwise>false</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <td nowrap="yes">
    <div>
      <xsl:attribute name="class">
        <xsl:choose>
          <xsl:when test="$active='true'">cuesSecondaryTab cuesSecondaryTabCaptionActive</xsl:when>
          <xsl:otherwise>cuesSecondaryTab cuesSecondaryTabCaptionInactive</xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <xsl:attribute name="id">
        <xsl:text>cuesSecondaryTabset_</xsl:text><xsl:value-of select="$tabindex"/><xsl:text>_tab</xsl:text>
      </xsl:attribute>
      <xsl:if test="@id">
        <xsl:attribute name="appid">
          <xsl:value-of select="@id"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:attribute name="onclick">
        <xsl:text>return cuesDrawnShape.toggleSecondaryTab('cuesSecondaryTabset',</xsl:text><xsl:value-of select="$tabindex"/><xsl:text>,true,event)</xsl:text>
      </xsl:attribute>
      <xsl:attribute name="onmouseover">
        <xsl:text>return cuesDrawnShape.secondarytabMouseover('cuesSecondaryTabset',</xsl:text><xsl:value-of select="$tabindex"/><xsl:text>)</xsl:text>
      </xsl:attribute>
      <xsl:attribute name="onmouseout">
        <xsl:text>return cuesDrawnShape.secondarytabMouseout('cuesSecondaryTabset',</xsl:text><xsl:value-of select="$tabindex"/><xsl:text>)</xsl:text>
      </xsl:attribute>
      <div class="cuesSecondaryTabCaption">
        <a class="cuesSecondaryTabLink">
          <xsl:attribute name="id">
            <xsl:text>cuesid_cuesSecondaryTabset_</xsl:text><xsl:value-of select="$tabindex"/>
          </xsl:attribute>
          <xsl:attribute name="onfocus">
            <xsl:text>return cuesDrawnShape.secondarytabMouseover('cuesSecondaryTabset',</xsl:text><xsl:value-of select="$tabindex"/><xsl:text>)</xsl:text>
          </xsl:attribute>
          <xsl:attribute name="onblur">
            <xsl:text>return cuesDrawnShape.secondarytabMouseout('cuesSecondaryTabset',</xsl:text><xsl:value-of select="$tabindex"/><xsl:text>)</xsl:text>
          </xsl:attribute>
          <xsl:attribute name="onclick">
            <xsl:text>return cuesDrawnShape.toggleSecondaryTab('cuesSecondaryTabset',</xsl:text><xsl:value-of select="$tabindex"/><xsl:text>,false,event)</xsl:text>
          </xsl:attribute>
          <xsl:attribute name="target"><xsl:value-of select="@target"/></xsl:attribute>
          <xsl:attribute name="href"><xsl:value-of select="@onclick"/></xsl:attribute>
          <nobr>
            <xsl:call-template name="lookup">
              <xsl:with-param name="key" select="@title"/>
              <xsl:with-param name="keyed" select="@titleaskey"/>
              <xsl:with-param name="locale" select="../@setLocale"/>
            </xsl:call-template>
          </nobr>
        </a>
      </div>
    </div>
  </td>
</xsl:template>

<xsl:template match="cues:sortablecolumn">
  <xsl:variable name="sorted">
    <xsl:choose>
      <xsl:when test="@sorted='ascending'">ascending</xsl:when>
      <xsl:when test="@sorted='descending'">descending</xsl:when>
      <xsl:otherwise>none</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="reserve">
    <xsl:choose>
      <xsl:when test="$sorted!='none'">true</xsl:when>
      <xsl:when test="@reservespace='true'">true</xsl:when>
      <xsl:otherwise>false</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:if test="$CUESSTYLEVERSION >= 60">
    <xsl:call-template name="starttag"/>
      <xsl:text>div style="position:relative;width:100%;white-space:nowrap;"</xsl:text>
    <xsl:call-template name="endtag"/>
    <span style="position:absolute;right:0;">      
      &#160;
      <xsl:call-template name="buildsortindicator"/>
    </span>
  </xsl:if>
  <a href="javascript:void(0)" title="Click to sort">
    <xsl:attribute name="class">
      <xsl:text>cuesSortableColumn cuesSorted</xsl:text>
      <xsl:value-of select="$sorted"/>
      <xsl:if test="$reserve='true'">
        <xsl:text> cuesSortableColumnReserve</xsl:text>
      </xsl:if>
    </xsl:attribute>
    <xsl:attribute name="id">
      <xsl:value-of select="@id"/>
      <xsl:text>_sortlink</xsl:text>
    </xsl:attribute>
    <xsl:attribute name="reservespace">
      <xsl:value-of select="$reserve"/>
    </xsl:attribute>
    <xsl:attribute name="onclick">
      <xsl:text>return cuesSortColumn('</xsl:text>
      <xsl:value-of select="@id"/>
      <xsl:text>','</xsl:text>
      <xsl:value-of select="$sorted"/>
      <xsl:text>','</xsl:text>
      <xsl:value-of select="@level"/>
      <xsl:text>',event,'</xsl:text>
      <xsl:value-of select="ancestor::cues:table/@id"/>
      <xsl:text>')</xsl:text>
    </xsl:attribute>
    <nobr>
      <xsl:apply-templates/>
    </nobr>
    <xsl:if test="$CUESSTYLEVERSION &lt; 60">
      <xsl:call-template name="buildsortindicator"/>
    </xsl:if>
  </a>
  <xsl:if test="$CUESSTYLEVERSION >= 60">
    <xsl:call-template name="starttag"/>
      <xsl:text>/div</xsl:text>
    <xsl:call-template name="endtag"/>
  </xsl:if>
</xsl:template>
<xsl:template name="buildsortindicator">  
  <xsl:text>&#160;</xsl:text>
  <xsl:choose>
    <xsl:when test="@sorted='ascending'">
      <img border="0" align="absmiddle">
        <xsl:attribute name="alt"><xsl:value-of select="$sortascending"/></xsl:attribute>
        <xsl:attribute name="title"><xsl:value-of select="$sortascending"/></xsl:attribute>
        <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/table-sort-ascend.gif</xsl:attribute>
        <xsl:attribute name="id"><xsl:value-of select="@id"/>_sorticon</xsl:attribute>
      </img>
    </xsl:when>
    <xsl:when test="@sorted='descending'">
      <img border="0" align="absmiddle">
        <xsl:attribute name="alt"><xsl:value-of select="$sortdescending"/></xsl:attribute>
        <xsl:attribute name="title"><xsl:value-of select="$sortdescending"/></xsl:attribute>
        <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/table-sort-descend.gif</xsl:attribute>
        <xsl:attribute name="id"><xsl:value-of select="@id"/>_sorticon</xsl:attribute>
      </img>
    </xsl:when>
    <xsl:otherwise>
      <img border="0" align="absmiddle" alt="" title="" style="display:none;">
        <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/table-sort-ascend.gif</xsl:attribute>
        <xsl:attribute name="id"><xsl:value-of select="@id"/>_sorticon</xsl:attribute>
      </img>
    </xsl:otherwise>
  </xsl:choose>
  <xsl:if test="@level">
    <sup>
      <xsl:value-of select="@level"/>
    </sup>
  </xsl:if>
</xsl:template>

<!-- cues:status id=foo name=foo disabled=true/false size=num initialvalue=num  -->
<xsl:template match="cues:spinner">
  <div class="cuesSpinnerContainer">
    <input type="text">
      <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
      <xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute>
      <xsl:attribute name="size">
        <xsl:choose>
          <xsl:when test="@size"><xsl:value-of select="@size"/></xsl:when>
          <xsl:otherwise>8</xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <xsl:attribute name="value"><xsl:value-of select="@value"/></xsl:attribute>
      <xsl:if test="@disabled">
        <xsl:attribute name="disabled"><xsl:value-of select="@disabled"/></xsl:attribute>
      </xsl:if>
    </input>
    <img border="0">
      <xsl:attribute name="alt"><xsl:value-of select="$spinner"/></xsl:attribute>
      <xsl:attribute name="title"><xsl:value-of select="$spinner"/></xsl:attribute>
      <xsl:attribute name="style">
        <xsl:text>position:absolute;top:</xsl:text>
        <xsl:choose>
          <xsl:when test="$ISIE='1'"><xsl:text>3</xsl:text></xsl:when>
          <xsl:otherwise><xsl:text>-1</xsl:text></xsl:otherwise>
        </xsl:choose>
        <xsl:text>;right:</xsl:text>
        <xsl:choose>
          <xsl:when test="$ISIE='1'"><xsl:text>1</xsl:text></xsl:when>
          <xsl:otherwise><xsl:text>2</xsl:text></xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>.spinner</xsl:text></xsl:attribute>
      <xsl:attribute name="src">
        <xsl:value-of select="$CUESKNOWNLOCATION"/>
        <xsl:text>cues_images/Spin17T</xsl:text>
        <xsl:if test="@disabled='true'"><xsl:text>Disabled</xsl:text></xsl:if>
        <xsl:text>.gif</xsl:text>
      </xsl:attribute>
      <xsl:attribute name="usemap"><xsl:text>#</xsl:text><xsl:value-of select="@id"/><xsl:text>.map</xsl:text></xsl:attribute>
    </img>
    <map>
      <xsl:attribute name="name"><xsl:value-of select="@id"/><xsl:text>.map</xsl:text></xsl:attribute>
      <area shape="rect" coords="0,0,17,8">
        <xsl:attribute name="href"><xsl:text>javascript:icuesSpin('</xsl:text><xsl:value-of select="@id"/><xsl:text>',1)</xsl:text></xsl:attribute>
        <xsl:attribute name="alt"><xsl:value-of select="$spinner"/></xsl:attribute>
      </area>
      <area shape="rect" coords="0,9,17,17">
        <xsl:attribute name="href"><xsl:text>javascript:icuesSpin('</xsl:text><xsl:value-of select="@id"/><xsl:text>',-1)</xsl:text></xsl:attribute>
        <xsl:attribute name="alt"><xsl:value-of select="$spinner"/></xsl:attribute>
      </area>
    </map>
  </div>
</xsl:template>

<!-- cues:status id=foo visible=true/false level=critical/error/success/warning/  -->
<xsl:template match="cues:status">
  <xsl:variable name="itemid">
    <xsl:value-of select="@id"/>
  </xsl:variable>
  <xsl:variable name="itemid2">
    <xsl:value-of select="@id"/><xsl:text>.content</xsl:text>
  </xsl:variable>
  <xsl:variable name="style">
    <xsl:choose>
      <xsl:when test="contains(@visible,'false')">display:none</xsl:when>
      <xsl:otherwise></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="imgfile">
    <xsl:choose>
      <xsl:when test="$CUESSTYLEVERSION >= 60 and contains(@level,'critical')"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_icons/Status_criticalerror_icon.png</xsl:when>
      <xsl:when test="$CUESSTYLEVERSION >= 60 and contains(@level,'error')"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_icons/Status_error_icon.png</xsl:when>
      <xsl:when test="$CUESSTYLEVERSION >= 60 and contains(@level,'success')"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_icons/Status_success_icon.png</xsl:when>
      <xsl:when test="$CUESSTYLEVERSION >= 60 and contains(@level,'warning')"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_icons/Status_warning_icon.png</xsl:when>
      <xsl:when test="$CUESSTYLEVERSION >= 60"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_icons/Status_information_icon.png</xsl:when>
      <xsl:when test="contains(@level,'critical')"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_icons/AlertCritical16Wht.gif</xsl:when>
      <xsl:when test="contains(@level,'error')"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_icons/AlertError16Wht.gif</xsl:when>
      <xsl:when test="contains(@level,'success')"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_icons/AlertSuccess16Wht.gif</xsl:when>
      <xsl:when test="contains(@level,'warning')"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_icons/Warning16Wht.gif</xsl:when>
      <xsl:otherwise><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_icons/AlertInformation16Wht.gif</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="alt">
    <xsl:choose>
      <xsl:when test="contains(@level,'critical')"><xsl:value-of select="$criticalerrormessage"/></xsl:when>
      <xsl:when test="contains(@level,'error')"><xsl:value-of select="$errormessage"/></xsl:when>
      <xsl:when test="contains(@level,'success')"><xsl:value-of select="$successmessage"/></xsl:when>
      <xsl:when test="contains(@level,'warning')"><xsl:value-of select="$warningmessage"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$informationalmessage"/></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="boxclass">
    <xsl:choose>
      <xsl:when test="contains(@level,'critical')">cuesStatusBoxError</xsl:when>
      <xsl:when test="contains(@level,'error')">cuesStatusBoxError</xsl:when>
      <xsl:otherwise>cuesStatusBox</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="textclass">
    <xsl:choose>
      <xsl:when test="contains(@level,'critical')">cuesStatusTextError</xsl:when>
      <xsl:when test="contains(@level,'error')">cuesStatusTextError</xsl:when>
      <xsl:otherwise>cuesStatusText</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <fieldset width="100%">
    <xsl:if test="@id">
      <xsl:attribute name="id"><xsl:value-of select="$itemid"/></xsl:attribute>
    </xsl:if>
    <xsl:attribute name="style"><xsl:value-of select="$style"/></xsl:attribute>
    <xsl:attribute name="class"><xsl:value-of select="$boxclass"/></xsl:attribute>
  <table>
  <tr>
  <td valign="top">
  <img onload="cuesFixPNG(null,this)">
    <xsl:attribute name="src"><xsl:value-of select="$imgfile"/></xsl:attribute>
    <xsl:attribute name="alt"><xsl:value-of select="$alt"/></xsl:attribute>
    <xsl:attribute name="title"><xsl:value-of select="$alt"/></xsl:attribute>
  </img>
  </td>
  <td>
    <xsl:if test="@id">
      <xsl:attribute name="id"><xsl:value-of select="$itemid2"/></xsl:attribute>
    </xsl:if>
    <xsl:attribute name="class"><xsl:value-of select="$textclass"/></xsl:attribute>
  <xsl:apply-templates/>
  </td>
  </tr>
  </table>
  </fieldset>
</xsl:template>

<xsl:template match="cues:table[@rowSelection]|cues:table[@rowselection]">
  <table border="0" cellspacing="0" class="cuesTableTitleContainer">
    <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
    <tr>
      <td class="cuesTableTitle" width="100%">
        <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>_title</xsl:text></xsl:attribute>
        <nobr>
          <xsl:call-template name="lookup">
            <xsl:with-param name="key" select="@title"/>
            <xsl:with-param name="keyed" select="@titleaskey"/>
            <xsl:with-param name="locale" select="@setLocale"/>
          </xsl:call-template>
        </nobr>
      </td>
      <xsl:call-template name="handleitemselectioncount"/>
      <td class="cuesTablePagingArea">
        <xsl:attribute name="id"><xsl:text>paging_</xsl:text><xsl:value-of select="@id"/></xsl:attribute>
        <xsl:text>&#160;&#160;</xsl:text>
        <xsl:apply-templates select="cues:tablepagecontrols[@group='rowsper']" mode="fromtable"/>
        <xsl:apply-templates select="cues:tablepagecontrols[@group='showingitems']" mode="fromtable"/>
      </td>
    </tr>
    <xsl:call-template name="handlebulkselection"/>
  </table>
  <xsl:apply-templates/>
</xsl:template>
<xsl:template match="cues:table">
  <table border="0" cellspacing="0">
    <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
    <xsl:attribute name="class">
      <xsl:choose>
        <xsl:when test="@title">cuesTableTitleContainer</xsl:when>
        <xsl:otherwise>cuesTableTitlelessContainer</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <tr>
      <xsl:if test="not(@title)">
        <xsl:attribute name="style">line-height:1px;</xsl:attribute>
      </xsl:if>
      <xsl:choose>
        <xsl:when test="not(@title)"><td width="100%">&#160;</td></xsl:when>
        <xsl:otherwise>
          <xsl:variable name="title">
            <xsl:call-template name="lookup">
              <xsl:with-param name="key" select="@title"/>
              <xsl:with-param name="keyed" select="@titleaskey"/>
              <xsl:with-param name="locale" select="@setLocale"/>
            </xsl:call-template>
          </xsl:variable>
          <td class="cuesTableTitle" width="100%">
            <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>_title</xsl:text></xsl:attribute>
            <nobr>
              <xsl:if test="@icon">
                <img>
                  <xsl:attribute name="alt"><xsl:value-of select="$title"/></xsl:attribute>
                  <xsl:attribute name="title"><xsl:value-of select="$title"/></xsl:attribute>
                  <xsl:attribute name="src"><xsl:value-of select="@icon"/></xsl:attribute>
                  <xsl:if test="$CUESSTYLEVERSION >= 61">
                    <xsl:attribute name="class">cuesTableTitleIcon</xsl:attribute>
                  </xsl:if>
                </img>
                <xsl:if test="$CUESSTYLEVERSION &lt; 61">
                  <xsl:text>&#160;</xsl:text>
                </xsl:if>
              </xsl:if>
              <xsl:value-of select="$title"/>

              <xsl:if test="@rss">
                <a class="cuesRSS" target="rsswindow">
                  <xsl:attribute name="href"><xsl:value-of select="@rss"/></xsl:attribute>
                  <img border="0">
                    <xsl:attribute name="alt"><xsl:value-of select="$rssfeed"/></xsl:attribute>
                    <xsl:attribute name="title"><xsl:value-of select="$rssfeed"/></xsl:attribute>
                    <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/rss_12.png</xsl:text></xsl:attribute>
                  </img>
                </a>
              </xsl:if>

            </nobr>
          </td>    
        </xsl:otherwise>
      </xsl:choose>      
      <xsl:call-template name="handleitemselectioncount"/>
      <td class="cuesTablePagingArea">
        <xsl:attribute name="id"><xsl:text>paging_</xsl:text><xsl:value-of select="@id"/></xsl:attribute>
        <xsl:text>&#160;&#160;</xsl:text>
        <xsl:apply-templates select="cues:tablepagecontrols[@group='rowsper']" mode="fromtable"/>
        <xsl:apply-templates select="cues:tablepagecontrols[@group='showingitems']" mode="fromtable"/>
      </td>
    </tr>  
    <xsl:call-template name="handlebulkselection"/>
  </table>
  <xsl:apply-templates/>
</xsl:template>
<xsl:template match="cues:tablecontent[@scroll='true']">
  <xsl:variable name="reorderable">
    <xsl:choose>
      <xsl:when test="@reorderable"><xsl:value-of select="@reorderable"/></xsl:when>
      <xsl:otherwise>false</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="hasspans">
    <xsl:choose>
      <xsl:when test="@hasspans"><xsl:value-of select="@hasspans"/></xsl:when>
      <xsl:otherwise>false</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="prefix">
    <xsl:choose>
      <xsl:when test="../@rowSelection='single'"></xsl:when>
      <xsl:when test="../@rowselection='single'"></xsl:when>
      <xsl:when test="../@rowSelection='multiple'"></xsl:when>
      <xsl:when test="../@rowselection='multiple'"></xsl:when>
      <xsl:otherwise>XX</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:if test="$ISFF='1' and $CUESSTYLEVERSION >= 62">
    <xsl:call-template name="starttag"/><xsl:text>div class="cuesTableHeaderDeadArea"</xsl:text><xsl:call-template name="endtag"/>
  </xsl:if>
  <div class="cuesTableHeaderContainer">
    <xsl:attribute name="id"><xsl:value-of select="../@id"/><xsl:text>.dh</xsl:text></xsl:attribute>
    <table border="0" cellspacing="0" class="cuesTableHeader">
      <xsl:attribute name="id"><xsl:value-of select="../@id"/><xsl:text>.th</xsl:text></xsl:attribute>
      <xsl:attribute name="baseid"><xsl:value-of select="../@id"/></xsl:attribute>
      <xsl:attribute name="hasspans"><xsl:value-of select="$hasspans"/></xsl:attribute>
      <xsl:attribute name="reorderable"><xsl:value-of select="$reorderable"/></xsl:attribute>
      <xsl:call-template name="tablecolumns">
        <xsl:with-param name="reorderable" select="@reorderable"/>
        <xsl:with-param name="rowselection" select="../@rowselection"/>
        <xsl:with-param name="rowSelection" select="../@rowSelection"/>
      </xsl:call-template>
      <xsl:apply-templates select="cues:tr[@header='true']"/>
    </table>
  </div>
  <xsl:if test="$ISFF='1' and $CUESSTYLEVERSION >= 62">
    <xsl:call-template name="starttag"/><xsl:text>/div</xsl:text><xsl:call-template name="endtag"/>
  </xsl:if>
  <div class="cuesTableContentContainer">
    <xsl:attribute name="id"><xsl:value-of select="../@id"/><xsl:text>.dd</xsl:text></xsl:attribute>
    <xsl:attribute name="onscroll"><xsl:text>return cuesScrollHandler('</xsl:text><xsl:value-of select="../@id"/><xsl:text>')</xsl:text></xsl:attribute>
    <table border="0" cellspacing="0" class="cuesTableContent">
      <xsl:attribute name="id"><xsl:value-of select="../@id"/><xsl:text>.td</xsl:text></xsl:attribute>
      <xsl:attribute name="baseid"><xsl:value-of select="../@id"/></xsl:attribute>
      <xsl:attribute name="hasspans"><xsl:value-of select="$hasspans"/></xsl:attribute>
      <xsl:attribute name="reorderable"><xsl:value-of select="$reorderable"/></xsl:attribute>
      <xsl:attribute name="summary">
        <xsl:call-template name="lookup">
          <xsl:with-param name="key" select="../@summary"/>
          <xsl:with-param name="keyed" select="../@summaryaskey"/>
          <xsl:with-param name="locale" select="../@setLocale"/>
        </xsl:call-template>
      </xsl:attribute>
      <caption style="display:none;">
        <xsl:call-template name="lookup">
          <xsl:with-param name="key" select="../@title"/>
          <xsl:with-param name="keyed" select="../@titleaskey"/>
          <xsl:with-param name="locale" select="../@setLocale"/>
        </xsl:call-template>
      </caption>
      <xsl:call-template name="tablecolumns">
        <xsl:with-param name="reorderable" select="@reorderable"/>
        <xsl:with-param name="rowselection" select="../@rowselection"/>
        <xsl:with-param name="rowSelection" select="../@rowSelection"/>
      </xsl:call-template>      
      <xsl:apply-templates select="cues:modelrow"/>
      <xsl:apply-templates select="cues:tr[not(@header)]"/>
      <xsl:apply-templates select="cues:emptyrow"/>
    </table>
  </div>
  <xsl:if test="../@rowSelection='single' or ../@rowselection='single' or
                ../@rowSelection='multiple' or ../@rowselection='multiple'">
    <script>
      <xsl:text>cuesMergeHeaderCells('</xsl:text>
      <xsl:value-of select="../@id"/>
      <xsl:text>',</xsl:text>
      <xsl:value-of select="count(cues:tr[@header='true'])"/>
      <xsl:text>,</xsl:text>
      <xsl:choose>
        <xsl:when test="@reorderable='true'">2</xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
      <xsl:text>);</xsl:text>
    </script>
  </xsl:if>
  <xsl:if test="descendant::cues:tabulargridcell">
    <script>
      <xsl:variable name="contentid"><xsl:value-of select="../@id"/><xsl:value-of select="$prefix"/><xsl:text>Content</xsl:text></xsl:variable>
      <xsl:text>icuesTabularGrid['</xsl:text><xsl:value-of select="../@id"/><xsl:text>']=true;</xsl:text>
      <xsl:text>if (document.addEventListener){</xsl:text>
      <xsl:text>  document.getElementById("</xsl:text><xsl:value-of select="$contentid"/><xsl:text>").addEventListener("keypress", icuesTabularGridOnkey, true);</xsl:text>
      <xsl:text>  document.getElementById("</xsl:text><xsl:value-of select="$contentid"/><xsl:text>").addEventListener("click", icuesTabularGridOnclick, true);</xsl:text>
      <xsl:text>}else{</xsl:text>
      <xsl:text>  document.getElementById("</xsl:text><xsl:value-of select="$contentid"/><xsl:text>").attachEvent("onkeypress", icuesTabularGridOnkey);</xsl:text>
      <xsl:text>  document.getElementById("</xsl:text><xsl:value-of select="$contentid"/><xsl:text>").attachEvent("onclick", icuesTabularGridOnclick);</xsl:text>
      <xsl:text>}</xsl:text>
    </script>
  </xsl:if>
  <xsl:if test="$hasspans='true'">
    <script>
      <xsl:text>cuesRestripeTableRows('</xsl:text><xsl:value-of select="../@id"/><xsl:text>');</xsl:text>
    </script>
  </xsl:if>
</xsl:template>
<xsl:template match="cues:tablecontent">
  <xsl:variable name="reorderable">
    <xsl:choose>
      <xsl:when test="@reorderable"><xsl:value-of select="@reorderable"/></xsl:when>
      <xsl:otherwise>false</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="hasspans">
    <xsl:choose>
      <xsl:when test="@hasspans"><xsl:value-of select="@hasspans"/></xsl:when>
      <xsl:otherwise>false</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <table border="0" cellspacing="0" class="cuesTableNonscrollable">
    <xsl:attribute name="id"><xsl:value-of select="../@id"/>.td</xsl:attribute>
    <xsl:attribute name="baseid"><xsl:value-of select="../@id"/></xsl:attribute>
    <xsl:attribute name="hasspans"><xsl:value-of select="$hasspans"/></xsl:attribute>
    <xsl:attribute name="reorderable"><xsl:value-of select="$reorderable"/></xsl:attribute>
    <xsl:attribute name="summary">
      <xsl:call-template name="lookup">
        <xsl:with-param name="key" select="../@summary"/>
        <xsl:with-param name="keyed" select="../@summaryaskey"/>
        <xsl:with-param name="locale" select="../@setLocale"/>
      </xsl:call-template>
    </xsl:attribute>
    <caption style="display:none;">
      <xsl:call-template name="lookup">
        <xsl:with-param name="key" select="../@title"/>
        <xsl:with-param name="keyed" select="../@titleaskey"/>
        <xsl:with-param name="locale" select="../@setLocale"/>
      </xsl:call-template>
    </caption>
    <xsl:apply-templates/>
  </table>
  <xsl:if test="descendant::cues:tabulargridcell">
    <xsl:variable name="contentid"><xsl:value-of select="../@id"/><xsl:text>XXContent</xsl:text></xsl:variable>
    <script>
      <xsl:text>icuesTabularGrid['</xsl:text><xsl:value-of select="../@id"/><xsl:text>']=true;</xsl:text>
      <xsl:text>if (document.addEventListener){</xsl:text>
      <xsl:text>  document.getElementById("</xsl:text><xsl:value-of select="$contentid"/><xsl:text>").addEventListener("keypress", icuesTabularGridOnkey, true);</xsl:text>
      <xsl:text>  document.getElementById("</xsl:text><xsl:value-of select="$contentid"/><xsl:text>").addEventListener("click", icuesTabularGridOnclick, true);</xsl:text>
      <xsl:text>}else{</xsl:text>
      <xsl:text>  document.getElementById("</xsl:text><xsl:value-of select="$contentid"/><xsl:text>").attachEvent("onkeypress", icuesTabularGridOnkey);</xsl:text>
      <xsl:text>  document.getElementById("</xsl:text><xsl:value-of select="$contentid"/><xsl:text>").attachEvent("onclick", icuesTabularGridOnclick);</xsl:text>
      <xsl:text>}</xsl:text>
    </script>
  </xsl:if>
  <xsl:if test="$hasspans='true'">
    <script>
      <xsl:text>cuesRestripeTableRows('</xsl:text><xsl:value-of select="../@id"/><xsl:text>');</xsl:text>
    </script>
  </xsl:if>
</xsl:template>
<xsl:template match="cues:tablefooter">
  <div style="width:100%">
    <table border="0" cellspacing="0" cellpadding="0" class="cuesTableButtonArea">
      <xsl:attribute name="id"><xsl:value-of select="../@id"/><xsl:text>Footer</xsl:text></xsl:attribute>
      <xsl:apply-templates/>
    </table>
  </div>
</xsl:template>
<xsl:template match="cues:emptyrow">
  <tr class="cuesTableRowEmpty">
    <xsl:if test="@id">
      <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
    </xsl:if>
    <xsl:if test="../@reorderable='true'">
      <td class="cuesTableReorderColumn">&#160;</td>
    </xsl:if>
    <xsl:if test="../../@rowSelection='single' or ../../@rowselection='single'">
      <td width="20">
        <input disabled="true" type="radio">
          <xsl:attribute name="title"><xsl:value-of select="$singlerowselection"/></xsl:attribute>
        </input>
      </td>
    </xsl:if>
    <xsl:if test="../../@rowSelection='multiple' or ../../@rowselection='multiple'">
      <td width="20" class="cuesTableSelectionColumn">
        <input disabled="true" type="checkbox">
          <xsl:attribute name="title"><xsl:value-of select="$multiplerowselection"/></xsl:attribute>
        </input>
      </td>
    </xsl:if>
    <td>
      <xsl:if test="@colspan">
        <xsl:attribute name="colspan"><xsl:value-of select="@colspan"/></xsl:attribute>
      </xsl:if>
      <xsl:value-of select="$emptyrow"/>
    </td>
  </tr>
</xsl:template>
<xsl:template match="cues:tablespecial">
  <div class="cuesTableSpecialContainer">
    <xsl:attribute name="id"><xsl:value-of select="../@id"/><xsl:text>.ds</xsl:text></xsl:attribute>
    <table border="0" cellspacing="0" class="cuesTableSpecial">
      <xsl:attribute name="id"><xsl:value-of select="../@id"/><xsl:text>.ts</xsl:text></xsl:attribute>
      <xsl:apply-templates select="cues:tr" mode="specialrow"/>
      <xsl:call-template name="tablecolumns">
        <xsl:with-param name="reorderable" select="../cues:tablecontent/@reorderable"/>
        <xsl:with-param name="rowselection" select="../@rowselection"/>
        <xsl:with-param name="rowSelection" select="../@rowSelection"/>
      </xsl:call-template>
    </table>
  </div>
</xsl:template>

<xsl:template match="cues:tablepagecontrols[@group='paging']">
  <xsl:variable name="ownerid"><xsl:value-of select="ancestor::cues:table/@id"/></xsl:variable>
  <table cellpadding="0" cellspacing="0" class="cuesTablePagingGoto">
    <tr>
      <xsl:choose>
        <xsl:when test="$CUESSTYLEVERSION >= 60">
          <xsl:call-template name="tablepagecontrols_backbuttons">
            <xsl:with-param name="ownerid" select="$ownerid"/>
          </xsl:call-template>
          <xsl:call-template name="tablepagecontrols_pageinfo">
            <xsl:with-param name="ownerid" select="$ownerid"/>
          </xsl:call-template>
          <xsl:call-template name="tablepagecontrols_forwardbuttons">
            <xsl:with-param name="ownerid" select="$ownerid"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="tablepagecontrols_pageinfo">
            <xsl:with-param name="ownerid" select="$ownerid"/>
          </xsl:call-template>
          <xsl:call-template name="tablepagecontrols_backbuttons">
            <xsl:with-param name="ownerid" select="$ownerid"/>
          </xsl:call-template>
          <xsl:call-template name="tablepagecontrols_forwardbuttons">
            <xsl:with-param name="ownerid" select="$ownerid"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </tr>
  </table>
</xsl:template>
<xsl:template match="cues:tablepagecontrols[@group='clientpaging']">
  <xsl:variable name="ownerid"><xsl:value-of select="ancestor::cues:table/@id"/></xsl:variable>
  <table cellpadding="0" cellspacing="0" class="cuesTablePagingGoto">
    <tr>
      <xsl:choose>
        <xsl:when test="$CUESSTYLEVERSION >= 60">
          <xsl:call-template name="tablepagecontrols_backbuttons">
            <xsl:with-param name="ownerid" select="$ownerid"/>
            <xsl:with-param name="usage" select="client"/>
          </xsl:call-template>
          <xsl:call-template name="tablepagecontrols_pageinfo">
            <xsl:with-param name="ownerid" select="$ownerid"/>
            <xsl:with-param name="usage" select="client"/>
          </xsl:call-template>
          <xsl:call-template name="tablepagecontrols_forwardbuttons">
            <xsl:with-param name="ownerid" select="$ownerid"/>
            <xsl:with-param name="usage" select="client"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="tablepagecontrols_pageinfo">
            <xsl:with-param name="ownerid" select="$ownerid"/>
            <xsl:with-param name="usage" select="client"/>
          </xsl:call-template>
          <xsl:call-template name="tablepagecontrols_backbuttons">
            <xsl:with-param name="ownerid" select="$ownerid"/>
            <xsl:with-param name="usage" select="client"/>
          </xsl:call-template>
          <xsl:call-template name="tablepagecontrols_forwardbuttons">
            <xsl:with-param name="ownerid" select="$ownerid"/>
            <xsl:with-param name="usage" select="client"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </tr>
  </table>
</xsl:template>
<xsl:template name="tablepagecontrols_pageinfo">
  <xsl:param name="ownerid"/>
  <xsl:param name="usage">server</xsl:param>
  <td nowrap="yes">
    <label>
      <xsl:attribute name="for"><xsl:text>activepage_</xsl:text><xsl:value-of select="$ownerid"/></xsl:attribute>
      <xsl:text>&#160;</xsl:text>
      <xsl:value-of select="$page"/>
      <xsl:text>&#160;</xsl:text>
    </label>
  </td>
  <td>
    <input style="text-align:right" type="text" size="3">
      <xsl:attribute name="id"><xsl:text>activepage_</xsl:text><xsl:value-of select="$ownerid"/></xsl:attribute>
      <xsl:attribute name="value"><xsl:value-of select="@currentpage"/></xsl:attribute>      
      <xsl:attribute name="onkeypress">
        <xsl:text>return cuesPagingTableGoToHandler(event,this,'</xsl:text>
        <xsl:value-of select="$ownerid"/>
        <xsl:if test="$usage='server'">
          <xsl:text>','</xsl:text>
          <xsl:value-of select="@rowsperpage"/>
        </xsl:if>
        <xsl:text>')</xsl:text>
      </xsl:attribute>
    </input>
  </td>
  <td nowrap="yes">
    <xsl:text>&#160;</xsl:text>
    <xsl:value-of select="$of"/>
    <xsl:text>&#160;</xsl:text>
    <span>
      <xsl:attribute name="id"><xsl:text>totalpages_</xsl:text><xsl:value-of select="$ownerid"/></xsl:attribute>
      <xsl:choose>
        <xsl:when test="@totalpages='-1'">
          <xsl:text>?</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="@totalpages"/>
        </xsl:otherwise>
      </xsl:choose>
    </span>
    <xsl:text>&#160;</xsl:text>
  </td>
</xsl:template>
<xsl:template name="tablepagecontrols_backbuttons">
  <xsl:param name="ownerid"/>
  <xsl:param name="usage">server</xsl:param>
  <td nowrap="yes">
    <xsl:text>&#160;</xsl:text>
    <button type="button" class="cuesButton cuesTablePagingButton">
      <xsl:attribute name="id"><xsl:text>firstpage_</xsl:text><xsl:value-of select="$ownerid"/></xsl:attribute>
      <xsl:attribute name="onclick">
        <xsl:text>cuesPage</xsl:text>
        <xsl:if test="$usage='client'">
          <xsl:text>Client</xsl:text>
        </xsl:if>
        <xsl:text>Table('</xsl:text>
        <xsl:value-of select="$ownerid"/><xsl:text>',1,-2,'</xsl:text><xsl:value-of select="@rowsperpage"/><xsl:text>')</xsl:text>
      </xsl:attribute>
      <xsl:if test="@currentpage='1'"><xsl:attribute name="disabled">yes</xsl:attribute></xsl:if>
      <img border="0">
        <xsl:attribute name="title"><xsl:value-of select="$firstpage"/></xsl:attribute>
        <xsl:attribute name="alt"><xsl:value-of select="$firstpage"/></xsl:attribute>
        <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/First</xsl:text><xsl:if test="@currentpage='1'"><xsl:text>-D</xsl:text></xsl:if><xsl:text>.gif</xsl:text></xsl:attribute>
      </img>
    </button>
    <xsl:if test="$CUESSTYLEVERSION &lt; 63">
      <xsl:text>&#160;</xsl:text>
    </xsl:if>
    <button type="button" class="cuesButton cuesTablePagingButton">
      <xsl:attribute name="id"><xsl:text>prevpage_</xsl:text><xsl:value-of select="$ownerid"/></xsl:attribute>
      <xsl:attribute name="onclick">
        <xsl:text>cuesPage</xsl:text>
        <xsl:if test="$usage='client'">
          <xsl:text>Client</xsl:text>
        </xsl:if>
        <xsl:text>Table('</xsl:text>
        <xsl:value-of select="$ownerid"/><xsl:text>',</xsl:text><xsl:value-of select="@currentpage"/><xsl:text>,-1,'</xsl:text><xsl:value-of select="@rowsperpage"/><xsl:text>')</xsl:text>
      </xsl:attribute>
      <xsl:if test="@currentpage='1'"><xsl:attribute name="disabled">yes</xsl:attribute></xsl:if>
      <img border="0">
        <xsl:attribute name="title"><xsl:value-of select="$previouspage"/></xsl:attribute>
        <xsl:attribute name="alt"><xsl:value-of select="$previouspage"/></xsl:attribute>
        <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/Previous</xsl:text><xsl:if test="@currentpage='1'"><xsl:text>-D</xsl:text></xsl:if><xsl:text>.gif</xsl:text></xsl:attribute>
      </img>
    </button>
    <xsl:text>&#160;</xsl:text>
  </td>
</xsl:template>
<xsl:template name="tablepagecontrols_forwardbuttons">
  <xsl:param name="ownerid"/>
  <xsl:param name="usage">server</xsl:param>
  <td nowrap="yes">
    <xsl:text>&#160;</xsl:text>
    <button type="button" class="cuesButton cuesTablePagingButton">
      <xsl:attribute name="id"><xsl:text>nextpage_</xsl:text><xsl:value-of select="$ownerid"/></xsl:attribute>
      <xsl:attribute name="onclick">
        <xsl:text>cuesPage</xsl:text>
        <xsl:if test="$usage='client'">
          <xsl:text>Client</xsl:text>
        </xsl:if>
        <xsl:text>Table('</xsl:text>
        <xsl:value-of select="$ownerid"/><xsl:text>',</xsl:text><xsl:value-of select="@currentpage"/><xsl:text>,1,'</xsl:text><xsl:value-of select="@rowsperpage"/><xsl:text>')</xsl:text>
      </xsl:attribute>
      <xsl:if test="@currentpage=@totalpages"><xsl:attribute name="disabled">yes</xsl:attribute></xsl:if>
      <img border="0">
        <xsl:attribute name="title"><xsl:value-of select="$nextpage"/></xsl:attribute>
        <xsl:attribute name="alt"><xsl:value-of select="$nextpage"/></xsl:attribute>
        <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/Next</xsl:text><xsl:if test="@currentpage=@totalpages"><xsl:text>-D</xsl:text></xsl:if><xsl:text>.gif</xsl:text></xsl:attribute>
      </img>
    </button>
    <xsl:if test="$CUESSTYLEVERSION &lt; 63">
      <xsl:text>&#160;</xsl:text>
    </xsl:if>
    <button type="button" class="cuesButton cuesTablePagingButton">
      <xsl:attribute name="id"><xsl:text>lastpage_</xsl:text><xsl:value-of select="$ownerid"/></xsl:attribute>
      <xsl:attribute name="onclick">
        <xsl:text>cuesPage</xsl:text>
        <xsl:if test="$usage='client'">
          <xsl:text>Client</xsl:text>
        </xsl:if>
        <xsl:text>Table('</xsl:text>
        <xsl:value-of select="$ownerid"/><xsl:text>',</xsl:text><xsl:value-of select="@totalpages"/><xsl:text>,2,'</xsl:text><xsl:value-of select="@rowsperpage"/><xsl:text>')</xsl:text>
      </xsl:attribute>
      <xsl:if test="@currentpage=@totalpages"><xsl:attribute name="disabled">yes</xsl:attribute></xsl:if>
      <img border="0">
        <xsl:attribute name="title"><xsl:value-of select="$lastpage"/></xsl:attribute>
        <xsl:attribute name="alt"><xsl:value-of select="$lastpage"/></xsl:attribute>
        <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/Last</xsl:text><xsl:if test="@currentpage=@totalpages"><xsl:text>-D</xsl:text></xsl:if><xsl:text>.gif</xsl:text></xsl:attribute>
      </img>
    </button>
  </td>
</xsl:template>
<xsl:template match="cues:tablepagecontrols[@group='rowsper']" mode="fromtable">
  <xsl:variable name="ownerid"><xsl:value-of select="ancestor::cues:table/@id"/></xsl:variable>
  <nobr>
    <span class="cuesTablePagingItems">
      <xsl:choose>
        <xsl:when test="$CUESSTYLEVERSION >= 60">
          <xsl:value-of select="$showing"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$items"/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:text>&#160;</xsl:text>
      <span>
        <xsl:attribute name="id"><xsl:text>firstitem_</xsl:text><xsl:value-of select="$ownerid"/></xsl:attribute>
        <xsl:value-of select="@firstitem"/>
      </span>
      <xsl:text>-</xsl:text>
      <span>
        <xsl:attribute name="id"><xsl:text>lastitem_</xsl:text><xsl:value-of select="$ownerid"/></xsl:attribute>
        <xsl:value-of select="@lastitem"/>
      </span>
      <xsl:text>&#160;</xsl:text>
      <xsl:value-of select="$of"/>
      <xsl:text>&#160;</xsl:text>
      <span>
        <xsl:attribute name="id"><xsl:text>totalitems_</xsl:text><xsl:value-of select="$ownerid"/></xsl:attribute>
        <xsl:choose>
          <xsl:when test="@totalitems='-1'">
            <xsl:text>?</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="@totalitems"/>
          </xsl:otherwise>
        </xsl:choose>
      </span>
    </span>
    <xsl:text>&#160;&#160;</xsl:text>
    <span class="cuesTablePagingRowsPer">
      <xsl:if test="$CUESSTYLEVERSION &lt; 60">
        <xsl:text>|&#160;&#160;</xsl:text>
          <xsl:value-of select="$rowsperpage"/>
        <xsl:text>:&#160;</xsl:text>
      </xsl:if>
      <select>
        <xsl:attribute name="title"><xsl:value-of select="$rowsperpage"/></xsl:attribute>
        <xsl:attribute name="id"><xsl:value-of select="$ownerid"/><xsl:text>_rowsper</xsl:text></xsl:attribute>
        <option value="10">
          <xsl:if test="@rowsperpage='10'"><xsl:attribute name="selected">test</xsl:attribute></xsl:if>
          <xsl:text>10</xsl:text></option>
        <option value="25">
          <xsl:if test="@rowsperpage='25'"><xsl:attribute name="selected">test</xsl:attribute></xsl:if>
          <xsl:text>25</xsl:text></option>
        <option value="50">
          <xsl:if test="@rowsperpage='50'"><xsl:attribute name="selected">test</xsl:attribute></xsl:if>
          <xsl:text>50</xsl:text></option>
        <option value="100">
          <xsl:if test="@rowsperpage='100'"><xsl:attribute name="selected">test</xsl:attribute></xsl:if>
          <xsl:text>100</xsl:text></option>
        <xsl:if test="@appmaxrows">
          <option>
            <xsl:attribute name="value"><xsl:value-of select="@appmaxrows"/></xsl:attribute>
            <xsl:if test="@rowsperpage=@appmaxrows"><xsl:attribute name="selected">test</xsl:attribute></xsl:if>
            <xsl:value-of select="@appmaxrows"/></option>
        </xsl:if>
        <xsl:choose>
          <xsl:when test="@allowallrows='false'"></xsl:when>
          <xsl:otherwise>
            <option value="all">
              <xsl:if test="@rowsperpage='all'"><xsl:attribute name="selected">test</xsl:attribute></xsl:if>
              <xsl:value-of select="$all"/></option>
          </xsl:otherwise>
        </xsl:choose>
      </select>
      <xsl:if test="$CUESSTYLEVERSION >= 60">
        <xsl:text>&#160;</xsl:text>
          <xsl:value-of select="$perpage"/>
        <xsl:if test="$CUESSTYLEVERSION &lt; 63">
          <xsl:text>&#160;</xsl:text>
        </xsl:if>
      </xsl:if>
      <button type="button" class="cuesButton">
        <xsl:attribute name="id"><xsl:value-of select="$ownerid"/><xsl:text>_rowsper_action</xsl:text></xsl:attribute>
        <xsl:attribute name="onclick"><xsl:text>cuesPagingTableRowsPerHandler(event,'</xsl:text><xsl:value-of select="$ownerid"/><xsl:text>','</xsl:text><xsl:value-of select="@currentpage"/><xsl:text>')</xsl:text></xsl:attribute>
        <xsl:value-of select="$go"/>
      </button>
    </span>
  </nobr>
</xsl:template>
<xsl:template match="cues:tablepagecontrols[@group='showingitems']" mode="fromtable">
  <xsl:variable name="ownerid"><xsl:value-of select="ancestor::cues:table/@id"/></xsl:variable>
  <nobr>
    <span class="cuesTablePagingItems">
      <xsl:choose>
        <xsl:when test="$CUESSTYLEVERSION >= 60">
          <xsl:value-of select="$showing"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$items"/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:text>&#160;</xsl:text>
      <span>
        <xsl:attribute name="id"><xsl:text>firstitem_</xsl:text><xsl:value-of select="$ownerid"/></xsl:attribute>
        <xsl:value-of select="@firstitem"/>
      </span>
      <xsl:text>-</xsl:text>
      <span>
        <xsl:attribute name="id"><xsl:text>lastitem_</xsl:text><xsl:value-of select="$ownerid"/></xsl:attribute>
        <xsl:value-of select="@lastitem"/>
      </span>
      <xsl:text>&#160;</xsl:text>
      <xsl:value-of select="$of"/>
      <xsl:text>&#160;</xsl:text>
      <span>
        <xsl:attribute name="id"><xsl:text>totalitems_</xsl:text><xsl:value-of select="$ownerid"/></xsl:attribute>
        <xsl:choose>
          <xsl:when test="@totalitems='-1'">
            <xsl:text>?</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="@totalitems"/>
          </xsl:otherwise>
        </xsl:choose>
      </span>
    </span>
    <xsl:text>&#160;</xsl:text>
  </nobr>
</xsl:template>
<xsl:template match="cues:tablepagecontrols[@group='rowsper']">
</xsl:template>
<xsl:template match="cues:tablepagecontrols[@group='showingitems']">
</xsl:template>
<xsl:template match="cues:reordercontrols">
  <xsl:variable name="id"><xsl:value-of select="ancestor::cues:table/@id"/></xsl:variable>
  <button style="padding-right:0px;padding-left:0px;" type="button">
    <xsl:attribute name="id"><xsl:value-of select="$id"/><xsl:text>_moveup</xsl:text></xsl:attribute>
    <xsl:if test="@disabled='true'">
      <xsl:attribute name="disabled">true</xsl:attribute>
    </xsl:if>
    <xsl:attribute name="alt"><xsl:value-of select="$moveup"/></xsl:attribute>
    <xsl:attribute name="title"><xsl:value-of select="$moveup"/></xsl:attribute>
    <xsl:attribute name="onclick"><xsl:text>cuesMoveSelectedTableRows('</xsl:text><xsl:value-of select="$id"/><xsl:text>','up')</xsl:text></xsl:attribute>
    <xsl:text>&#160;</xsl:text>
    <img alt="" title="" style="vertical-align:text-top;">
      <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/MoveUp12T</xsl:text><xsl:if test="@disabled='true'"><xsl:text>-D</xsl:text></xsl:if><xsl:text>.gif</xsl:text></xsl:attribute>
      <xsl:attribute name="alt"><xsl:value-of select="$moveup"/></xsl:attribute>
    </img>
    <xsl:text>&#160;</xsl:text>
  </button>
  <button type="button" class="cuesButton">
    <xsl:attribute name="id"><xsl:value-of select="$id"/><xsl:text>_moveto</xsl:text></xsl:attribute>
    <xsl:if test="@disabled='true'">
      <xsl:attribute name="disabled">true</xsl:attribute>
    </xsl:if>
    <xsl:attribute name="alt"><xsl:value-of select="$moveabsolute"/></xsl:attribute>
    <xsl:attribute name="title"><xsl:value-of select="$moveabsolute"/></xsl:attribute>
    <xsl:attribute name="onclick"><xsl:text>cuesMovetoPrompt('</xsl:text><xsl:value-of select="$id"/><xsl:text>')</xsl:text></xsl:attribute>
    <xsl:value-of select="$moveto_moveto"/>
  </button>
  <button style="padding-right:0px;padding-left:0px;" type="button" class="cuesButton">  
    <xsl:attribute name="id"><xsl:value-of select="$id"/><xsl:text>_movedown</xsl:text></xsl:attribute>
    <xsl:if test="@disabled='true'">
      <xsl:attribute name="disabled">true</xsl:attribute>
    </xsl:if>
    <xsl:attribute name="alt"><xsl:value-of select="$movedown"/></xsl:attribute>
    <xsl:attribute name="title"><xsl:value-of select="$movedown"/></xsl:attribute>
    <xsl:attribute name="onclick"><xsl:text>cuesMoveSelectedTableRows('</xsl:text><xsl:value-of select="$id"/><xsl:text>','down')</xsl:text></xsl:attribute>
    <xsl:text>&#160;</xsl:text>
    <img alt="" title="" style="vertical-align:text-top;">
      <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/MoveDown12T</xsl:text><xsl:if test="@disabled='true'"><xsl:text>-D</xsl:text></xsl:if><xsl:text>.gif</xsl:text></xsl:attribute>
      <xsl:attribute name="alt"><xsl:value-of select="$movedown"/></xsl:attribute>
    </img>
    <xsl:text>&#160;</xsl:text>
  </button>
</xsl:template>
<xsl:template match="cues:tr[@header='true']">
  <tr>
    <xsl:call-template name="rowselection"/>
    <xsl:apply-templates/>
  </tr>
</xsl:template>
<xsl:template match="cues:tr[@accessibility='true']">
  <tr class="cuesTableRowAccessibility">
    <xsl:call-template name="rowselection"/>
    <xsl:apply-templates/>
  </tr>
</xsl:template>
<xsl:template match="cues:tr[@model='true']">
  <xsl:call-template name="modeltablerow"/>
</xsl:template>
<xsl:template match="cues:modelrow">
  <xsl:call-template name="modeltablerow"/>
</xsl:template>
<xsl:template name="modeltablerow">
  <script>
    <xsl:text>cuesModelRow['</xsl:text>
    <xsl:value-of select="../../@id"/>
    <xsl:text>']='</xsl:text>
    <xsl:choose>
      <xsl:when test="../@reorderable='true'"><xsl:text>T</xsl:text></xsl:when>
      <xsl:otherwise><xsl:text>F</xsl:text></xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="../@scroll='true'"><xsl:text>T</xsl:text></xsl:when>
      <xsl:otherwise><xsl:text>F</xsl:text></xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="../../@rowSelection='single' or ../../@rowselection='single'"><xsl:text>S</xsl:text></xsl:when>
      <xsl:when test="../../@rowSelection='multiple' or ../../@rowselection='multiple'"><xsl:text>M</xsl:text></xsl:when>
      <xsl:otherwise><xsl:text> </xsl:text></xsl:otherwise>
    </xsl:choose>
    <table>
      <tr class="cuesTableRowEven">
        <xsl:if test="$CUESSTYLEVERSION >= 61">
          <xsl:attribute name="onmouseover">icuesTableRowMouseOverHandler(this)</xsl:attribute>
          <xsl:attribute name="onmouseout">icuesTableRowMouseOutHandler(this)</xsl:attribute>
        </xsl:if>
        <xsl:if test="../../@rowclickable='true'">
          <xsl:if test="../../@rowSelection='single' or ../../@rowselection='single'">
            <xsl:attribute name="onclick">
              <xsl:text>return icuesSelectTableRow(event,this,&amp;apos;</xsl:text>
              <xsl:value-of select="../../@id"/>
              <xsl:text>&amp;apos;,null)</xsl:text>
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="../../@rowSelection='multiple' or ../../@rowselection='multiple'">
            <xsl:attribute name="onclick">
              <xsl:text>return icuesToggleTableRowSelection(event,this,&amp;apos;</xsl:text>
              <xsl:value-of select="../../@id"/>
              <xsl:text>&amp;apos;,null)</xsl:text>
            </xsl:attribute>
          </xsl:if>
        </xsl:if>
        <xsl:if test="../@reorderable='true'"><td class="cuesTableReorderColumn">0</td></xsl:if>
        <xsl:call-template name="rowselection"/>
        <xsl:apply-templates mode="dump"/>
      </tr>
    </table>
    <xsl:text>';</xsl:text>
  </script>
</xsl:template>
<xsl:template match="cues:tr" mode="specialrow">
  <tr class="cuesTableRowSpecial">
    <xsl:if test="@id">
      <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
    </xsl:if>
    <xsl:if test="$CUESSTYLEVERSION >= 61">
      <xsl:attribute name="onmouseover">icuesTableRowMouseOverHandler(this)</xsl:attribute>
      <xsl:attribute name="onmouseout">icuesTableRowMouseOutHandler(this)</xsl:attribute>
    </xsl:if>
    <xsl:if test="../@containstree='true'">
      <xsl:call-template name="rowtree"/>
    </xsl:if>
    <xsl:call-template name="rowselection"/>
    <xsl:apply-templates/>
  </tr>
</xsl:template>
<xsl:template match="cues:tr">
  <tr>
    <xsl:attribute name="class">
      <xsl:choose>
        <xsl:when test="count(preceding-sibling::cues:tr) mod 2 = 0"><xsl:text>cuesTableRowEven</xsl:text></xsl:when>
        <xsl:otherwise><xsl:text>cuesTableRowOdd</xsl:text></xsl:otherwise>
      </xsl:choose>
      <xsl:if test="@errored='true'"><xsl:text>Errored</xsl:text></xsl:if>
      <xsl:if test="@selected='true'"><xsl:text>Selected</xsl:text></xsl:if>
    </xsl:attribute>
    <xsl:if test="@id">
      <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
    </xsl:if>
    <xsl:if test="$CUESSTYLEVERSION >= 61">
      <xsl:if test="@span">
        <xsl:attribute name="spaninfo"><xsl:value-of select="@span"/></xsl:attribute>
      </xsl:if>
      <xsl:attribute name="onmouseover">icuesTableRowMouseOverHandler(this)</xsl:attribute>
      <xsl:attribute name="onmouseout">icuesTableRowMouseOutHandler(this)</xsl:attribute>
    </xsl:if>
    <xsl:if test="../../@rowclickable='true'">
      <xsl:if test="../../@rowSelection='single' or ../../@rowselection='single'">
        <xsl:attribute name="onclick">
          <xsl:text>return icuesSelectTableRow(event,this,'</xsl:text>
          <xsl:value-of select="../../@id"/>
          <xsl:text>',null)</xsl:text>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="../../@rowSelection='multiple' or ../../@rowselection='multiple'">
        <xsl:attribute name="onclick">
          <xsl:text>return icuesToggleTableRowSelection(event,this,'</xsl:text>
          <xsl:value-of select="../../@id"/>
          <xsl:text>',null)</xsl:text>
        </xsl:attribute>
      </xsl:if>
    </xsl:if>
    <xsl:if test="../@containstree='true'">
      <xsl:call-template name="rowtree"/>
    </xsl:if>
    <xsl:call-template name="rowselection"/>
    <xsl:apply-templates/>
  </tr>
</xsl:template>
<xsl:template name="rowtreeid">
  <xsl:param name="rowlevel"/>
  <xsl:text>K</xsl:text>
  <xsl:choose>
    <xsl:when test="$rowlevel = 0">
      <xsl:value-of select="count(preceding-sibling::cues:tr[@treelevel = 0]) + 1"/><xsl:text>.</xsl:text>
    </xsl:when>
    <xsl:when test="$rowlevel = 1">
      <xsl:value-of select="count(preceding-sibling::cues:tr[@treelevel = 0])"/><xsl:text>.</xsl:text>
      <xsl:value-of select="count(preceding-sibling::cues:tr[@treelevel = 1]) + 1"/><xsl:text>.</xsl:text>
    </xsl:when>
    <xsl:when test="$rowlevel = 2">
      <xsl:value-of select="count(preceding-sibling::cues:tr[@treelevel = 0])"/><xsl:text>.</xsl:text>
      <xsl:value-of select="count(preceding-sibling::cues:tr[@treelevel = 1])"/><xsl:text>.</xsl:text>
      <xsl:value-of select="count(preceding-sibling::cues:tr[@treelevel = 2]) + 1"/><xsl:text>.</xsl:text>
    </xsl:when>
    <xsl:when test="$rowlevel = 3">
      <xsl:value-of select="count(preceding-sibling::cues:tr[@treelevel = 0])"/><xsl:text>.</xsl:text>
      <xsl:value-of select="count(preceding-sibling::cues:tr[@treelevel = 1])"/><xsl:text>.</xsl:text>
      <xsl:value-of select="count(preceding-sibling::cues:tr[@treelevel = 2])"/><xsl:text>.</xsl:text>
      <xsl:value-of select="count(preceding-sibling::cues:tr[@treelevel = 3]) + 1"/><xsl:text>.</xsl:text>
    </xsl:when>
    <xsl:when test="$rowlevel = 4">
      <xsl:value-of select="count(preceding-sibling::cues:tr[@treelevel = 0])"/><xsl:text>.</xsl:text>
      <xsl:value-of select="count(preceding-sibling::cues:tr[@treelevel = 1])"/><xsl:text>.</xsl:text>
      <xsl:value-of select="count(preceding-sibling::cues:tr[@treelevel = 2])"/><xsl:text>.</xsl:text>
      <xsl:value-of select="count(preceding-sibling::cues:tr[@treelevel = 3])"/><xsl:text>.</xsl:text>
      <xsl:value-of select="count(preceding-sibling::cues:tr[@treelevel = 4]) + 1"/><xsl:text>.</xsl:text>
    </xsl:when>
  </xsl:choose>
</xsl:template>
<xsl:template name="rowtreestate">
  <xsl:param name="rowlevel"/>
  <xsl:if test="preceding-sibling::cues:tr[@treelevel = $rowlevel - 1][1]/./@expanded = 'false'">
    <xsl:attribute name="style"><xsl:text>display:none</xsl:text></xsl:attribute>
  </xsl:if>
  <xsl:if test="preceding-sibling::cues:tr[@treelevel = $rowlevel - 2][1]/./@expanded = 'false'">
    <xsl:attribute name="style"><xsl:text>display:none</xsl:text></xsl:attribute>
  </xsl:if>
  <xsl:if test="preceding-sibling::cues:tr[@treelevel = $rowlevel - 3][1]/./@expanded = 'false'">
    <xsl:attribute name="style"><xsl:text>display:none</xsl:text></xsl:attribute>
  </xsl:if>
  <xsl:if test="preceding-sibling::cues:tr[@treelevel = $rowlevel - 3][1]/./@expanded = 'false'">
    <xsl:attribute name="style"><xsl:text>display:none</xsl:text></xsl:attribute>
  </xsl:if>
  <xsl:if test="preceding-sibling::cues:tr[@treelevel = $rowlevel - 4][1]/./@expanded = 'false'">
    <xsl:attribute name="style"><xsl:text>display:none</xsl:text></xsl:attribute>
  </xsl:if>
</xsl:template>
<xsl:template name="rowtree">
  <xsl:if test="../@containstree='true'">
    <xsl:choose>
      <xsl:when test="@expanded">
        <xsl:attribute name="treeexpanded"><xsl:value-of select="@expanded"/></xsl:attribute>
      </xsl:when>
      <xsl:otherwise>
        <xsl:attribute name="treeexpanded">true</xsl:attribute>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:attribute name="treelevel"><xsl:value-of select="@treelevel"/></xsl:attribute>
    <xsl:attribute name="treeid">
      <xsl:call-template name="rowtreeid">
        <xsl:with-param name="rowlevel" select="@treelevel"/>
      </xsl:call-template>
    </xsl:attribute>
    <xsl:choose>
      <xsl:when test="@treelevel = 0 and $CUESSTYLEVERSION &lt; 60">
        <xsl:attribute name="class">cuesTableTreeRowTop</xsl:attribute>
      </xsl:when>
      <xsl:when test="@treelevel != 0 and $CUESSTYLEVERSION &lt; 60">
        <xsl:attribute name="class">cuesTableTreeRowChild</xsl:attribute>
      </xsl:when>
      <xsl:when test="@treelevel = 0 and $CUESSTYLEVERSION >= 60 and count(preceding-sibling::cues:tr[@treelevel=0]) mod 2 = 1">
        <xsl:attribute name="class">cuesTableTreeRowTopEven</xsl:attribute>
      </xsl:when>
      <xsl:when test="@treelevel = 0 and $CUESSTYLEVERSION >= 60">
        <xsl:attribute name="class">cuesTableTreeRowTopOdd</xsl:attribute>
      </xsl:when>
      <xsl:when test="@treelevel != 0 and $CUESSTYLEVERSION >= 60">        
        <xsl:variable name="mypos"><xsl:value-of select="count(preceding-sibling::cues:tr)"/></xsl:variable>
        <xsl:for-each select="preceding-sibling::cues:tr[@treelevel=0]">
          <xsl:if test="position() = last()">
            <xsl:variable name="parentpos"><xsl:value-of select="count(preceding-sibling::cues:tr)"/></xsl:variable>
            <xsl:variable name="topcount"><xsl:value-of select="count(preceding-sibling::cues:tr[@treelevel=0])"/></xsl:variable>
            <xsl:choose>
              <xsl:when test="($mypos - $parentpos) mod 2 = 0 and $topcount mod 2 = 1">
                <xsl:attribute name="class">cuesTableTreeRowChildEven</xsl:attribute>
              </xsl:when>
              <xsl:when test="($mypos - $parentpos) mod 2 = 1 and $topcount mod 2 = 1">
                <xsl:attribute name="class">cuesTableTreeRowChildOdd</xsl:attribute>
              </xsl:when>
              <xsl:when test="($mypos - $parentpos) mod 2 = 0 and $topcount mod 2 = 0">
                <xsl:attribute name="class">cuesTableTreeRowChildOdd</xsl:attribute>
              </xsl:when>
              <xsl:otherwise>
                <xsl:attribute name="class">cuesTableTreeRowChildEven</xsl:attribute>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:if>
        </xsl:for-each>
      </xsl:when>
      <xsl:when test="@treelevel != 0 and $CUESSTYLEVERSION >= 60 and count(preceding-sibling::cues:tr[@treelevel=0]) mod 2 = 1">        
        <xsl:attribute name="class">cuesTableTreeRowChildOdd</xsl:attribute>
      </xsl:when>
      <xsl:when test="@treelevel != 0 and $CUESSTYLEVERSION >= 60">
        <xsl:attribute name="class">cuesTableTreeRowChildEven</xsl:attribute>
      </xsl:when>
    </xsl:choose>
    <xsl:call-template name="rowtreestate">
      <xsl:with-param name="rowlevel" select="@treelevel"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>
<xsl:template match="cues:col">
</xsl:template>
<xsl:template match="cues:col" mode="fromtable">
  <col>
    <xsl:choose>
      <xsl:when test="@width">
        <xsl:attribute name="width"><xsl:value-of select="@width"/></xsl:attribute>
        <xsl:attribute name="suggested"><xsl:value-of select="@width"/></xsl:attribute>
      </xsl:when>
      <xsl:otherwise>
        <xsl:attribute name="width">*</xsl:attribute>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="@classname">
      <xsl:attribute name="class"><xsl:value-of select="@classname"/></xsl:attribute>
    </xsl:if>
  </col>
</xsl:template>
<xsl:template name="tablecolumns">
  <xsl:param name="reorderable"/>
  <xsl:param name="rowselection"/>
  <xsl:param name="rowSelection"/>
  <xsl:if test="$reorderable='true'"><col width="40"/></xsl:if>
  <xsl:if test="$rowSelection='single' or
                $rowselection='single' or
                $rowSelection='multiple' or
                $rowselection='multiple'"><col width="38"/></xsl:if>
  <xsl:apply-templates select="../cues:col" mode="fromtable"/>
  <col width="*" class="cuesNowrap"/><col width="*" class="cuesNowrap"/>
  <col width="*" class="cuesNowrap"/><col width="*" class="cuesNowrap"/>
  <col width="*" class="cuesNowrap"/><col width="*" class="cuesNowrap"/>
  <col width="*" class="cuesNowrap"/><col width="*" class="cuesNowrap"/>
  <col width="*" class="cuesNowrap"/><col width="*" class="cuesNowrap"/>
  <col width="*" class="cuesNowrap"/><col width="*" class="cuesNowrap"/>
  <col width="*" class="cuesNowrap"/><col width="*" class="cuesNowrap"/>
  <col width="*" class="cuesNowrap"/><col width="*" class="cuesNowrap"/>
  <col width="*" class="cuesNowrap"/><col width="*" class="cuesNowrap"/>
  <col width="*" class="cuesNowrap"/><col width="*" class="cuesNowrap"/>
</xsl:template>
<xsl:template name="rowselection">
  <xsl:variable name="contentid"><xsl:value-of select="../../@id"/><xsl:if test="../@scroll='true'"><xsl:text>Content</xsl:text></xsl:if></xsl:variable>
  <xsl:variable name="rowselectionname">
    <xsl:choose>
      <xsl:when test="../../@rowSelectionName"><xsl:value-of select="../../@rowSelectionName"/></xsl:when>
      <xsl:when test="../../@rowselectionname"><xsl:value-of select="../../@rowselectionname"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="../../@id"/><xsl:text>_row_selector</xsl:text></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="selectionvalue">
    <xsl:choose>
      <xsl:when test="@selectionValue"><xsl:value-of select="@selectionValue"/></xsl:when>
      <xsl:when test="@selectionvalue"><xsl:value-of select="@selectionvalue"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="count(preceding-sibling::cues:tr)"/></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="selectiontooltip">
    <xsl:choose>
      <xsl:when test="@selectiontooltip"><xsl:value-of select="@selectiontooltip"/></xsl:when>
      <xsl:when test="contains(@header,'true')">
        <xsl:call-template name="escapeEmbedded">
          <xsl:with-param name="stringIn" select="$allrowselection"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="../../@rowSelection='single' or ../../@rowselection='single'">
        <xsl:call-template name="escapeEmbedded">
          <xsl:with-param name="stringIn" select="$singlerowselection"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="escapeEmbedded">
          <xsl:with-param name="stringIn" select="$multiplerowselection"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:choose>
    <xsl:when test="contains(@header,'true')">
      <xsl:choose>    
        <xsl:when test="../@scroll='true'">
          <xsl:if test="../@reorderable='true'">
            <td class="cuesTableReorderColumn">&#160;</td>
          </xsl:if>
          <xsl:if test="../../@rowSelection='single' or ../../@rowselection='single'">
            <td selectable="true" width="20">&#160;</td>
          </xsl:if>
          <xsl:if test="../../@rowSelection='multiple' or ../../@rowselection='multiple'">
            <td selectable="true" class="cuesTableSelectionColumn" width="20">
              <input type="checkbox">
                <xsl:attribute name="title"><xsl:value-of select="$selectiontooltip"/></xsl:attribute>
                <xsl:attribute name="onclick"><xsl:text>icuesToggleAllTableRows(this,"</xsl:text><xsl:value-of select="../../@id"/><xsl:text>","</xsl:text><xsl:value-of select="$contentid"/><xsl:text>")</xsl:text></xsl:attribute>
              </input>
            </td>
          </xsl:if>
        </xsl:when>
        <xsl:otherwise>
          <xsl:if test="../@reorderable='true'">
            <th class="cuesTableReorderColumn">&#160;</th>
          </xsl:if>
          <xsl:if test="../../@rowSelection='single' or ../../@rowselection='single'">
            <th selectable="true" width="20">&#160;</th>
          </xsl:if>
          <xsl:if test="../../@rowSelection='multiple' or ../../@rowselection='multiple'">
            <th selectable="true" class="cuesTableSelectionColumn" width="20">
              <input type="checkbox">
                <xsl:attribute name="title"><xsl:value-of select="$selectiontooltip"/></xsl:attribute>
                <xsl:attribute name="onclick"><xsl:text>icuesToggleAllTableRows(this,"</xsl:text><xsl:value-of select="../../@id"/><xsl:text>","</xsl:text><xsl:value-of select="$contentid"/><xsl:text>")</xsl:text></xsl:attribute>
              </input>
            </th>
          </xsl:if>
        </xsl:otherwise>
      </xsl:choose>    
    </xsl:when>
    <xsl:when test="local-name(..)='tablespecial'">
      <xsl:if test="../../cues:tablecontent[@reorderable='true']">
        <td class="cuesTableReorderColumn">**</td>
      </xsl:if>
      <xsl:if test="../../@rowSelection='multiple' or ../../@rowselection='multiple'">
        <td width="20" class="cuesTableSelectionColumn">
          <input rowselector="true" type="checkbox">
            <xsl:attribute name="title"><xsl:value-of select="$selectiontooltip"/></xsl:attribute>
            <xsl:attribute name="id"><xsl:value-of select="../../@id"/><xsl:text>SpecialCheckbox</xsl:text></xsl:attribute>
            <xsl:attribute name="onclick"><xsl:text>cuesSelectTableSpecialRow(this,"</xsl:text><xsl:value-of select="../../@id"/><xsl:text>")</xsl:text></xsl:attribute>
            <xsl:if test="@checked='true'">
              <xsl:attribute name="checked"><xsl:text>true</xsl:text></xsl:attribute>
            </xsl:if>
          </input>
        </td>
      </xsl:if>
    </xsl:when>
    <xsl:otherwise>
      <xsl:if test="../@reorderable='true'">
        <td class="cuesTableReorderColumn">
          <xsl:value-of select="1 + count(preceding-sibling::cues:tr[not(@model) and not(@header)])"/>
        </td>
      </xsl:if>
      <xsl:if test="../../@rowSelection='single' or ../../@rowselection='single'">
        <td width="20">
          <input rowselector="true" type="radio">
            <xsl:attribute name="title"><xsl:value-of select="$selectiontooltip"/></xsl:attribute>
            <xsl:attribute name="name"><xsl:value-of select="$rowselectionname"/></xsl:attribute>
            <xsl:attribute name="value"><xsl:value-of select="$selectionvalue"/></xsl:attribute>
            <xsl:attribute name="onclick">
              <xsl:if test="../@containstree='true'">
                <xsl:text>icuesMakeTreeTableRowVisible(this);</xsl:text>
              </xsl:if>
              <xsl:text>return icuesSelectTableRow(event,this,"</xsl:text><xsl:value-of select="../../@id"/><xsl:text>")</xsl:text>
            </xsl:attribute>
            <xsl:if test="@selectionDisabled='true'">
              <xsl:attribute name="disabled"><xsl:text>true</xsl:text></xsl:attribute>
            </xsl:if>
            <xsl:if test="@selectiondisabled='true'">
              <xsl:attribute name="disabled"><xsl:text>true</xsl:text></xsl:attribute>
            </xsl:if>
            <xsl:if test="@selected='true'">
              <xsl:attribute name="checked"><xsl:text>true</xsl:text></xsl:attribute>
            </xsl:if>
          </input>
        </td>
      </xsl:if>
      <xsl:if test="../../@rowSelection='multiple' or ../../@rowselection='multiple'">
        <td width="20">
          <input rowselector="true" type="checkbox">
            <xsl:attribute name="title"><xsl:value-of select="$selectiontooltip"/></xsl:attribute>
            <xsl:attribute name="name"><xsl:value-of select="$rowselectionname"/></xsl:attribute>
            <xsl:attribute name="value"><xsl:value-of select="$selectionvalue"/></xsl:attribute>
            <xsl:attribute name="onclick"><xsl:text>return icuesToggleTableRowSelection(event,this,"</xsl:text><xsl:value-of select="../../@id"/><xsl:text>")</xsl:text></xsl:attribute>
            <xsl:if test="@selectionDisabled='true'">
              <xsl:attribute name="disabled"><xsl:text>true</xsl:text></xsl:attribute>
            </xsl:if>
            <xsl:if test="@selectiondisabled='true'">
              <xsl:attribute name="disabled"><xsl:text>true</xsl:text></xsl:attribute>
            </xsl:if>
            <xsl:if test="@selected='true'">
              <xsl:attribute name="checked"><xsl:text>true</xsl:text></xsl:attribute>
            </xsl:if>
          </input>
        </td>
      </xsl:if>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
<xsl:template match="cues:treetablenode">
  <xsl:variable name="depth"><xsl:value-of select="../@treelevel"/></xsl:variable>
  <td nowrap="yes">
    <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
    <xsl:attribute name="style"><xsl:text>padding-left:</xsl:text><xsl:value-of select="$depth * 16"/><xsl:text>px</xsl:text></xsl:attribute>
    <xsl:choose>
      <xsl:when test="../@leafnode='true'">
        <img class="cuesTreetableNodeLeaf" title="leaf" alt="leaf">
          <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/treeBullet.gif</xsl:attribute>
        </img>
      </xsl:when>
      <xsl:when test="../@expanded='false'">
        <button type="button" class="cuesTreetableNodeCollapsed" onclick="cuesToggleTreeTable(this)">
          <xsl:attribute name="alt"><xsl:value-of select="$expandtree"/></xsl:attribute>
          <xsl:attribute name="title"><xsl:value-of select="$expandtree"/></xsl:attribute>
          <span>&#160;</span>
        </button>
      </xsl:when>
      <xsl:otherwise>
        <button type="button" class="cuesTreetableNodeExpanded" onclick="cuesToggleTreeTable(this)">
          <xsl:attribute name="alt"><xsl:value-of select="$collapsetree"/></xsl:attribute>
          <xsl:attribute name="title"><xsl:value-of select="$collapsetree"/></xsl:attribute>
          <span>&#160;</span>
        </button>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates/>
  </td>
</xsl:template>
<xsl:template name="handleitemselectioncount">
  <xsl:if test="@selectioncount and $CUESSTYLEVERSION >= 61">
    <td class="cuesTableSelectionCountArea">
      <nobr>
      <span>
        <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>.selectioncount</xsl:text></xsl:attribute>
        <xsl:value-of select="@selectioncount"/>
      </span>
      <xsl:text>&#160;</xsl:text>
      <xsl:value-of select="$itemsselected"/>
      <xsl:text>,</xsl:text>
      </nobr>
    </td>
  </xsl:if>
</xsl:template>
<xsl:template name="handlebulkselection">
  <xsl:if test="@bulkselectionaction and $CUESSTYLEVERSION >= 61">
    <tr class="cuesTableBulkSelectionArea" style="display:none;">
      <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>.bulkselectionarea</xsl:text></xsl:attribute>
      <td colspan="3">
        <div class="cuesTableBulkSelectionContainer">
          <xsl:value-of select="substring-before($bulkvisible,'xxx')"/>
          <span>
            <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>.bulkvisible</xsl:text></xsl:attribute>
            0
          </span>
          <xsl:text>&#160;</xsl:text>
          <xsl:value-of select="substring-after($bulkvisible,'xxx')"/>          
          <xsl:text>&#160;</xsl:text>
          <a>
            <xsl:attribute name="href"><xsl:value-of select="@bulkselectionaction"/><xsl:text>.bulkselectionlayer</xsl:text></xsl:attribute>
            <xsl:value-of select="substring-before($bulktotal,'xxx')"/>
            <span>
              <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>.bulktotal</xsl:text></xsl:attribute>
              0
            </span>
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="substring-after($bulktotal,'xxx')"/>          
          </a>
          <div class="cuesTableBulkSelectionLayer">
            <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>.bulkselectionlayer</xsl:text></xsl:attribute>
            &#160;
          </div>
        </div>
      </td>
    </tr>
  </xsl:if>
</xsl:template>
<xsl:template match="cues:clearfiltercolumn">
  <button type="button"
     onclick="icuesClearColumnFilter(this)"
     tabindex="-1"
     onmouseover="this.style.visibility='visible'"
     class="cuesTableClearColumnFilter">   
   <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>.clear</xsl:text></xsl:attribute>
   <xsl:attribute name="action"><xsl:value-of select="@onclick"/></xsl:attribute>
   <xsl:attribute name="title"><xsl:value-of select="$matchclear"/></xsl:attribute>
   <xsl:text>X</xsl:text>
 </button>
</xsl:template>

<xsl:template match="cues:tablesearch[@searchform='type1']|cues:tablesearch[@searchForm='type1']">
  <div class="cuesTableFilterArea">
    <table cellpadding="0" cellspacing="0">
    <tr>
    <td>
    <form>
      <xsl:if test="@method">
        <xsl:attribute name="method"><xsl:value-of select="@method"/></xsl:attribute>
      </xsl:if>
      <xsl:attribute name="action"><xsl:value-of select="@action"/></xsl:attribute>
      <table cellpadding="0" cellspacing="0">
        <xsl:attribute name="id"><xsl:value-of select="../@id"/><xsl:text>.searchitems</xsl:text></xsl:attribute>
      <tr>
      <td valign="bottom">
      <nobr>
      <xsl:if test="@disclosure='true' and $CUESSTYLEVERSION >= 61">
        <button class="cuesButton cuesTableMultiFilterTogglerDisabled" disabled="true" type="button" state="shown">
          <xsl:attribute name="title"><xsl:value-of select="$togglefilters"/><xsl:text>.searchitems</xsl:text></xsl:attribute>
        <xsl:attribute name="id"><xsl:value-of select="../@id"/>.searchtoggler</xsl:attribute>
        <xsl:attribute name="onclick"><xsl:text>icuesManageTableSearchMultiFilters('</xsl:text><xsl:value-of select="../@id"/><xsl:text>',null,this)</xsl:text></xsl:attribute>
          <span>&#160;&#160;&#160;&#160;</span>
        </button>
      </xsl:if>
      <label>
        <xsl:attribute name="for"><xsl:value-of select="../@id"/>.SColumn</xsl:attribute>
        <xsl:value-of select="$filter"/>
      </label>
      </nobr>
      </td>
      <td valign="bottom" style="display:none;">
        <label class="invisibleLabel">
          <xsl:attribute name="for"><xsl:value-of select="../@id"/><xsl:text>.SRelop</xsl:text></xsl:attribute>
          <xsl:value-of select="$filterrelationship"/>
        </label>
        <select name="Relop" disabled="true">
          <xsl:attribute name="id"><xsl:value-of select="../@id"/><xsl:text>.SRelop</xsl:text></xsl:attribute>
          <xsl:attribute name="onchange"><xsl:text>icuesChangeTableSearchRelop('</xsl:text><xsl:value-of select="../@id"/><xsl:text>',this)</xsl:text></xsl:attribute>
          <option value="and"><xsl:value-of select="$and"/></option>
          <option value="or"><xsl:value-of select="$or"/></option>
        </select>
      </td>
      <td valign="bottom" nowrap="yes">
      <xsl:text>&#160;</xsl:text>
      <label class="invisibleLabel">
        <xsl:attribute name="for"><xsl:value-of select="../@id"/>.SText</xsl:attribute>
        Search text
      </label>
      <input type="text" size="20" name="Stext">
        <xsl:attribute name="onkeydown"><xsl:text>cuesEnableTableSearch('</xsl:text><xsl:value-of select="../@id"/><xsl:text>',true,false,false,this)</xsl:text></xsl:attribute>
        <xsl:attribute name="id"><xsl:value-of select="../@id"/><xsl:text>.SText</xsl:text></xsl:attribute>
      </input>
      <xsl:text>&#160;</xsl:text>
      </td>

      <xsl:if test="@multiple='true'">
        <td valign="bottom">
          <button class="cuesButton cuesTableMultiFilterButton" disabled="true" type="button">
            <xsl:attribute name="onclick"><xsl:text>icuesRemoveTableSearch('</xsl:text><xsl:value-of select="../@id"/><xsl:text>',this)</xsl:text></xsl:attribute>
            <img>
              <xsl:attribute name="alt"><xsl:value-of select="$addfilter"/></xsl:attribute>
              <xsl:attribute name="title"><xsl:value-of select="$addfilter"/></xsl:attribute>
              <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/RemoveFilterT_disabled.gif</xsl:text></xsl:attribute>
            </img>
          </button>
        </td>
        <td valign="bottom">
          <button class="cuesButton cuesTableMultiFilterButton" type="button">
            <xsl:attribute name="onclick"><xsl:text>icuesAddTableSearch('</xsl:text><xsl:value-of select="../@id"/><xsl:text>',this)</xsl:text></xsl:attribute>
            <img>
              <xsl:attribute name="alt"><xsl:value-of select="$addfilter"/></xsl:attribute>
              <xsl:attribute name="title"><xsl:value-of select="$addfilter"/></xsl:attribute>
              <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/AddFilter.png</xsl:text></xsl:attribute>
            </img>
          </button>
        </td>
      </xsl:if>
      <td rowspan="20" valign="bottom">

      <button disabled="true" name="Saction" type="submit" value="go" class="cuesButton">
        <xsl:attribute name="id"><xsl:value-of select="../@id"/><xsl:text>.Saction</xsl:text></xsl:attribute>
        <xsl:value-of select="$matchgo"/>
      </button>
      </td>
      </tr>
      </table>
      </form>
      </td>
      <td valign="bottom">
      <form>
        <xsl:if test="@method">
          <xsl:attribute name="method"><xsl:value-of select="@method"/></xsl:attribute>
        </xsl:if>
        <xsl:attribute name="action"><xsl:value-of select="@clearaction"/></xsl:attribute>
        <xsl:text>&#160;</xsl:text>
        <button name="Saction" type="submit" value="clear" class="cuesButton">
          <xsl:value-of select="$matchclear"/>
        </button>
      </form>
    </td>
    </tr>
    </table>
  </div>
  <script>    
    <xsl:text>icuesInitTableSearch("</xsl:text>
    <xsl:value-of select="../@id"/>
    <xsl:text>","</xsl:text>
    <xsl:value-of select="@multiple"/>
    <xsl:text>","","","","</xsl:text>
    <xsl:value-of select="@initialtext"/>
    <xsl:text>");</xsl:text>
  </script>
</xsl:template>
<xsl:template match="cues:tablesearch[@searchform='type2']|cues:tablesearch[@searchForm='type2']">
  <div class="cuesTableFilterArea">
    <table cellpadding="0" cellspacing="0">
    <tr>
    <td>
    <form>
      <xsl:if test="@method">
        <xsl:attribute name="method"><xsl:value-of select="@method"/></xsl:attribute>
      </xsl:if>
      <xsl:attribute name="action"><xsl:value-of select="@action"/></xsl:attribute>
      <table cellpadding="0" cellspacing="0">
        <xsl:attribute name="id"><xsl:value-of select="../@id"/><xsl:text>.searchitems</xsl:text></xsl:attribute>
      <tr>
      <td valign="bottom"> 
      <label>
        <xsl:attribute name="for"><xsl:value-of select="../@id"/><xsl:text>.SColumn</xsl:text></xsl:attribute>
        <xsl:value-of select="$filter"/>
      </label>
      </td>
      <td valign="bottom" style="display:none;">
        <label class="invisibleLabel">
          <xsl:attribute name="for"><xsl:value-of select="../@id"/><xsl:text>.SRelop</xsl:text></xsl:attribute>
          <xsl:value-of select="$filterrelationship"/>
        </label>
        <select name="Relop" disabled="true">
          <xsl:attribute name="id"><xsl:value-of select="../@id"/><xsl:text>.SRelop</xsl:text></xsl:attribute>
          <xsl:attribute name="onchange"><xsl:text>icuesChangeTableSearchRelop('</xsl:text><xsl:value-of select="../@id"/><xsl:text>',this)</xsl:text></xsl:attribute>
          <option value="and"><xsl:value-of select="$and"/></option>
          <option value="or"><xsl:value-of select="$or"/></option>
        </select>
      </td>
      <td valign="bottom" nowrap="yes">
      <xsl:text>&#160;</xsl:text>
      <select name="SColumn">
        <xsl:attribute name="onchange">
          <xsl:text>cuesEnableTableSearch('</xsl:text>
          <xsl:value-of select="../@id"/>
          <xsl:text>',true,</xsl:text>
          <xsl:choose>
            <xsl:when test="not(@initialcolumtype)"><xsl:text>true</xsl:text></xsl:when>
            <xsl:otherwise>
              <xsl:text>false</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:text>,false,this)</xsl:text>
        </xsl:attribute>
        <xsl:attribute name="id"><xsl:value-of select="../@id"/><xsl:text>.SColumn</xsl:text></xsl:attribute>
        <xsl:apply-templates/>
      </select>
      <xsl:text>&#160;</xsl:text>
      <label class="invisibleLabel">
        <xsl:attribute name="for"><xsl:value-of select="../@id"/><xsl:text>.SText</xsl:text></xsl:attribute>
        Search text
      </label>
      <input type="text" size="20" name="Stext">
        <xsl:attribute name="onkeydown"><xsl:text>cuesEnableTableSearch('</xsl:text><xsl:value-of select="../@id"/><xsl:text>',true,false,false,this)</xsl:text></xsl:attribute>
        <xsl:attribute name="id"><xsl:value-of select="../@id"/>.SText</xsl:attribute>
      </input>
      <xsl:text>&#160;</xsl:text>
      </td>

      <xsl:if test="@multiple='true'">
        <td valign="bottom">
          <button class="cuesButton cuesTableMultiFilterButton" disabled="true" type="button">
            <xsl:attribute name="onclick"><xsl:text>icuesRemoveTableSearch('</xsl:text><xsl:value-of select="../@id"/><xsl:text>',this)</xsl:text></xsl:attribute>
            <img>
              <xsl:attribute name="alt"><xsl:value-of select="$addfilter"/></xsl:attribute>
              <xsl:attribute name="title"><xsl:value-of select="$addfilter"/></xsl:attribute>
              <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/RemoveFilterT_disabled.gif</xsl:text></xsl:attribute>
            </img>
          </button>
        </td>
        <td valign="bottom">
          <button class="cuesButton cuesTableMultiFilterButton" type="button">
            <xsl:attribute name="onclick"><xsl:text>icuesAddTableSearch('</xsl:text><xsl:value-of select="../@id"/><xsl:text>',this)</xsl:text></xsl:attribute>
            <img>
              <xsl:attribute name="alt"><xsl:value-of select="$addfilter"/></xsl:attribute>
              <xsl:attribute name="title"><xsl:value-of select="$addfilter"/></xsl:attribute>
              <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/AddFilter.png</xsl:text></xsl:attribute>
            </img>
          </button>
        </td>
      </xsl:if>
      <td rowspan="20" valign="bottom">
      <button disabled="true" name="Saction" type="submit" value="go" class="cuesButton">
        <xsl:attribute name="id"><xsl:value-of select="../@id"/><xsl:text>.Saction</xsl:text></xsl:attribute>
        <xsl:value-of select="$matchgo"/>
      </button>
      </td>
      </tr>
      </table>
      </form>
      </td>
      <td valign="bottom">
      <form>
        <xsl:if test="@method">
          <xsl:attribute name="method"><xsl:value-of select="@method"/></xsl:attribute>
        </xsl:if>
        <xsl:attribute name="action"><xsl:value-of select="@clearaction"/></xsl:attribute>
        <xsl:text>&#160;</xsl:text>
        <button name="Saction" type="submit" value="clear" class="cuesButton">
          <xsl:value-of select="$matchclear"/>
        </button>
      </form>
    </td>
    </tr>
    </table>
  </div>
  <script>    
    <xsl:text>icuesInitTableSearch("</xsl:text>
    <xsl:value-of select="../@id"/>
    <xsl:text>","</xsl:text>
    <xsl:value-of select="@multiple"/>
    <xsl:text>","","</xsl:text>
    <xsl:value-of select="@initialcolumn"/>
    <xsl:text>","</xsl:text>
    <xsl:value-of select="@initialmodifier"/>
    <xsl:text>","</xsl:text>
    <xsl:value-of select="@initialtext"/>
    <xsl:text>");</xsl:text>
  </script>
</xsl:template>
<xsl:template match="cues:tablesearch[@searchform='type3']|cues:tablesearch[@searchForm='type3']">
  <div class="cuesTableFilterArea">
    <table cellpadding="0" cellspacing="0">
    <tr>
    <td>
    <form>
      <xsl:if test="@method">
        <xsl:attribute name="method"><xsl:value-of select="@method"/></xsl:attribute>
      </xsl:if>
      <xsl:attribute name="action"><xsl:value-of select="@action"/></xsl:attribute>
      <table cellpadding="0" cellspacing="0">
        <xsl:attribute name="id"><xsl:value-of select="../@id"/><xsl:text>.searchitems</xsl:text></xsl:attribute>
      <tr>
      <td valign="bottom">      
        <label>
          <xsl:attribute name="for"><xsl:value-of select="../@id"/><xsl:text>.SColumn</xsl:text></xsl:attribute>
          <xsl:value-of select="$filter"/>
        </label>
      </td>
      <td valign="bottom" style="display:none;">
        <label class="invisibleLabel">
          <xsl:attribute name="for"><xsl:value-of select="../@id"/><xsl:text>.SRelop</xsl:text></xsl:attribute>
          <xsl:value-of select="$filterrelationship"/>
        </label>
        <select name="Relop" disabled="true">
          <xsl:attribute name="id"><xsl:value-of select="../@id"/><xsl:text>.SRelop</xsl:text></xsl:attribute>
          <xsl:attribute name="onchange"><xsl:text>icuesChangeTableSearchRelop('</xsl:text><xsl:value-of select="../@id"/><xsl:text>',this)</xsl:text></xsl:attribute>
          <option value="and">
            <xsl:if test="@relop='and'">
              <xsl:attribute name="selected">true</xsl:attribute>
            </xsl:if>
            <xsl:value-of select="$and"/></option>
          <option value="or">
            <xsl:if test="@relop='or'">
              <xsl:attribute name="selected">true</xsl:attribute>
            </xsl:if>
            <xsl:value-of select="$or"/></option>
        </select>
      </td>
      <td valign="bottom" nowrap="yes">
        <xsl:text>&#160;</xsl:text>
        <select name="SColumn">
          <xsl:attribute name="onchange">
            <xsl:text>cuesEnableTableSearch('</xsl:text>
            <xsl:value-of select="../@id"/>
            <xsl:text>',true,</xsl:text>
            <xsl:choose>
              <xsl:when test="not(@initialcolumtype)"><xsl:text>true</xsl:text></xsl:when>
              <xsl:otherwise>
                <xsl:text>false</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:text>,false,this)</xsl:text>
          </xsl:attribute>
          <xsl:attribute name="id"><xsl:value-of select="../@id"/><xsl:text>.SColumn</xsl:text></xsl:attribute>
          <xsl:apply-templates/>
        </select>
        <xsl:text>&#160;</xsl:text>
        <label>
          <xsl:attribute name="for"><xsl:value-of select="../@id"/><xsl:text>.Modifiers</xsl:text></xsl:attribute>
          <xsl:value-of select="$matchif"/>
        </label>
        <xsl:choose>
          <xsl:when test="@initialcolumntype">
            <xsl:text>&#160;</xsl:text>
            <select style="display:none" name="Modifiers">
              <xsl:attribute name="onchange"><xsl:text>cuesEnableTableSearch('</xsl:text><xsl:value-of select="../@id"/><xsl:text>',true,null,true,this)</xsl:text></xsl:attribute>
              <xsl:attribute name="id"><xsl:value-of select="../@id"/><xsl:text>.Modifiersboolean</xsl:text></xsl:attribute>
              <xsl:attribute name="title"><xsl:value-of select="$matchif"/></xsl:attribute>
              <option value="istrue"><xsl:value-of select="$matchistrue"/></option>
              <option value="isfalse"><xsl:value-of select="$matchisfalse"/></option>
            </select>
            <select style="display:none" name="Modifiers">
              <xsl:attribute name="onchange"><xsl:text>cuesEnableTableSearch('</xsl:text><xsl:value-of select="../@id"/><xsl:text>',true,null,true,this)</xsl:text></xsl:attribute>
              <xsl:attribute name="id"><xsl:value-of select="../@id"/><xsl:text>.Modifiersnumeric</xsl:text></xsl:attribute>
              <xsl:attribute name="title"><xsl:value-of select="$matchif"/></xsl:attribute>
              <option value="equal"><xsl:value-of select="$matchequal"/></option>
              <option value="notequal"><xsl:value-of select="$matchnotequal"/></option>
              <option value="greater"><xsl:value-of select="$matchgreater"/></option>
              <option value="greaterequal"><xsl:value-of select="$matchgreaterequal"/></option>
              <option value="less"><xsl:value-of select="$matchless"/></option>
              <option value="lessequal"><xsl:value-of select="$matchlessequal"/></option>
            </select>
            <select style="display:none" name="Modifiers">
              <xsl:attribute name="onchange"><xsl:text>cuesEnableTableSearch('</xsl:text><xsl:value-of select="../@id"/><xsl:text>',true,null,true,this)</xsl:text></xsl:attribute>
              <xsl:attribute name="id"><xsl:value-of select="../@id"/><xsl:text>.Modifiersalphanumeric</xsl:text></xsl:attribute>
              <xsl:attribute name="title"><xsl:value-of select="$matchif"/></xsl:attribute>
              <option value="contains"><xsl:value-of select="$matchcontains"/></option>
              <option value="notcontain"><xsl:value-of select="$matchnotcontain"/></option>
              <option value="startswith"><xsl:value-of select="$matchstartswith"/></option>
              <option value="endswith"><xsl:value-of select="$matchendswith"/></option>
              <option value="exactly"><xsl:value-of select="$matchexactly"/></option>
              <option value="notexactly"><xsl:value-of select="$matchnotexactly"/></option>
              <option value="empty"><xsl:value-of select="$matchempty"/></option>
              <option value="notempty"><xsl:value-of select="$matchnotempty"/></option>
              <option value="greater"><xsl:value-of select="$matchgreater"/></option>
              <option value="greaterequal"><xsl:value-of select="$matchgreaterequal"/></option>
              <option value="less"><xsl:value-of select="$matchless"/></option>
              <option value="lessequal"><xsl:value-of select="$matchlessequal"/></option>
            </select>
            <select style="display:none" name="Modifiers">
              <xsl:attribute name="onchange"><xsl:text>cuesEnableTableSearch('</xsl:text><xsl:value-of select="../@id"/><xsl:text>',true,null,true,this)</xsl:text></xsl:attribute>
              <xsl:attribute name="id"><xsl:value-of select="../@id"/><xsl:text>.Modifiersstring</xsl:text></xsl:attribute>
              <xsl:attribute name="title"><xsl:value-of select="$matchif"/></xsl:attribute>
              <option value="contains"><xsl:value-of select="$matchcontains"/></option>
              <option value="notcontain"><xsl:value-of select="$matchnotcontain"/></option>
              <option value="startswith"><xsl:value-of select="$matchstartswith"/></option>
              <option value="endswith"><xsl:value-of select="$matchendswith"/></option>
              <option value="exactly"><xsl:value-of select="$matchexactly"/></option>
              <option value="notexactly"><xsl:value-of select="$matchnotexactly"/></option>
              <option value="empty"><xsl:value-of select="$matchempty"/></option>
              <option value="notempty"><xsl:value-of select="$matchnotempty"/></option>
            </select>
            <select style="display:none" name="Modifiers">
              <xsl:attribute name="onchange"><xsl:text>cuesEnableTableSearch('</xsl:text><xsl:value-of select="../@id"/><xsl:text>',true,null,true,this)</xsl:text></xsl:attribute>
              <xsl:attribute name="id"><xsl:value-of select="../@id"/><xsl:text>.Modifiersdate</xsl:text></xsl:attribute>
              <xsl:attribute name="title"><xsl:value-of select="$matchif"/></xsl:attribute>
              <option value="equal"><xsl:value-of select="$matchequal"/></option>
              <option value="notequal"><xsl:value-of select="$matchnotequal"/></option>
              <option value="after"><xsl:value-of select="$matchafter"/></option>
              <option value="afterequal"><xsl:value-of select="$matchafterequal"/></option>
              <option value="before"><xsl:value-of select="$matchbefore"/></option>
              <option value="beforeequal"><xsl:value-of select="$matchbeforeequal"/></option>
            </select>
            <select style="display:none" name="Modifiers">
              <xsl:attribute name="onchange"><xsl:text>cuesEnableTableSearch('</xsl:text><xsl:value-of select="../@id"/><xsl:text>',true,null,true,this)</xsl:text></xsl:attribute>
              <xsl:attribute name="id"><xsl:value-of select="../@id"/><xsl:text>.Modifiersenum</xsl:text></xsl:attribute>
              <xsl:attribute name="title"><xsl:value-of select="$matchif"/></xsl:attribute>
              <option/>
            </select>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>&#160;</xsl:text>
            <select name="Modifiers">
              <xsl:attribute name="onchange"><xsl:text>cuesEnableTableSearch('</xsl:text><xsl:value-of select="../@id"/><xsl:text>',true,false,false,this)</xsl:text></xsl:attribute>
              <xsl:attribute name="id"><xsl:value-of select="../@id"/><xsl:text>.Modifiers</xsl:text></xsl:attribute>
              <option value="contains"><xsl:value-of select="$matchcontains"/></option>
              <option value="notcontain"><xsl:value-of select="$matchnotcontain"/></option>
              <option value="startswith"><xsl:value-of select="$matchstartswith"/></option>
              <option value="endswith"><xsl:value-of select="$matchendswith"/></option>
              <option value="exactly"><xsl:value-of select="$matchexactly"/></option>
              <option value="notexactly"><xsl:value-of select="$matchnotexactly"/></option>
              <option value="empty"><xsl:value-of select="$matchempty"/></option>
              <option value="notempty"><xsl:value-of select="$matchnotempty"/></option>
            </select>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:text>&#160;</xsl:text>
        <label class="invisibleLabel">
          <xsl:attribute name="for"><xsl:value-of select="../@id"/>.Stext</xsl:attribute>
          Search text
        </label>
        <input type="text" size="20" name="Stext">
          <xsl:attribute name="onkeydown">cuesEnableTableSearch('<xsl:value-of select="../@id"/>',true,false,false,this)</xsl:attribute>
          <xsl:attribute name="id"><xsl:value-of select="../@id"/>.Stext</xsl:attribute>
        </input>
        <xsl:text>&#160;</xsl:text>
      </td>
      <xsl:if test="@multiple='true'">
        <td valign="bottom">
          <button class="cuesButton cuesTableMultiFilterButton" disabled="true" type="button">
            <xsl:attribute name="onclick"><xsl:text>icuesRemoveTableSearch('</xsl:text><xsl:value-of select="../@id"/><xsl:text>',this)</xsl:text></xsl:attribute>
            <img>
              <xsl:attribute name="alt"><xsl:value-of select="$addfilter"/></xsl:attribute>
              <xsl:attribute name="title"><xsl:value-of select="$addfilter"/></xsl:attribute>
              <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/RemoveFilterT_disabled.gif</xsl:text></xsl:attribute>
            </img>
          </button>
        </td>
        <td valign="bottom">
          <button class="cuesButton cuesTableMultiFilterButton" type="button">
            <xsl:attribute name="onclick"><xsl:text>icuesAddTableSearch('</xsl:text><xsl:value-of select="../@id"/><xsl:text>',this)</xsl:text></xsl:attribute>
            <img>
              <xsl:attribute name="alt"><xsl:value-of select="$addfilter"/></xsl:attribute>
              <xsl:attribute name="title"><xsl:value-of select="$addfilter"/></xsl:attribute>
              <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/AddFilter.png</xsl:text></xsl:attribute>
            </img>
          </button>
        </td>
      </xsl:if>
      <td rowspan="20" valign="bottom">
        <button disabled="true" name="Saction" type="submit" value="go" class="cuesButton">
          <xsl:attribute name="id"><xsl:value-of select="../@id"/>.Saction</xsl:attribute>
          <xsl:value-of select="$matchgo"/>
        </button>
      </td>
      </tr>
      </table>
      </form>
      </td>
      <td valign="bottom">
      <form>
        <xsl:if test="@method">
          <xsl:attribute name="method"><xsl:value-of select="@method"/></xsl:attribute>
        </xsl:if>
        <xsl:attribute name="action"><xsl:value-of select="@clearaction"/></xsl:attribute>
        <xsl:text>&#160;</xsl:text>
        <button name="Saction" type="submit" value="clear" class="cuesButton">
          <xsl:value-of select="$matchclear"/>
        </button>
      </form>
      </td>
      </tr>
      </table>
  </div>
  <script>    
    <xsl:text>icuesInitTableSearch("</xsl:text>
    <xsl:value-of select="../@id"/>
    <xsl:text>","</xsl:text>
    <xsl:value-of select="@multiple"/>
    <xsl:text>","</xsl:text>
    <xsl:value-of select="@initialcolumntype"/>
    <xsl:text>","</xsl:text>
    <xsl:value-of select="@initialcolumn"/>
    <xsl:text>","</xsl:text>
    <xsl:value-of select="@initialmodifier"/>
    <xsl:text>","</xsl:text>
    <xsl:value-of select="@initialtext"/>
    <xsl:text>");</xsl:text>
  </script>
</xsl:template>
<xsl:template match="cues:tablesearch[@searchform='freeform']|cues:tablesearch[@searchForm='freeform']">
  <div class="cuesTableFilterArea">
    <xsl:apply-templates/>
  </div>
</xsl:template>
<xsl:template match="cues:tablesearchenum">
  <select style="display:none">
    <xsl:attribute name="id"><xsl:value-of select="../@id"/><xsl:text>.</xsl:text><xsl:value-of select="@id"/></xsl:attribute>
    <xsl:apply-templates/>
  </select>
  <script>
    <xsl:text>icuesPopulateTableSearchEnum('</xsl:text><xsl:value-of select="../@id"/><xsl:text>','</xsl:text><xsl:value-of select="@id"/><xsl:text>');</xsl:text>
  </script>
</xsl:template>

<xsl:template match="cues:tabulargridcell">
  <xsl:variable name="tableid"><xsl:value-of select="ancestor::cues:table/@id"/></xsl:variable>
  <xsl:variable name="rowposition"><xsl:value-of select="count(preceding::cues:tr[ancestor::cues:table/@id = $tableid])"/></xsl:variable>
  <xsl:variable name="rowcount"><xsl:value-of select="count(preceding::cues:tr[not(@header)][ancestor::cues:table/@id = $tableid])+1"/></xsl:variable>
  <xsl:variable name="colcount"><xsl:value-of select="count(preceding::cues:tabulargridcell[ancestor::cues:table/@id = $tableid][../../preceding-sibling::cues:tr[position()=$rowposition]])+1"/></xsl:variable>  
  <a href="javascript:void(0)"
     style="text-decoration:none;color:black;"
     onfocus="icuesTabularGridOnfocus(event,this)"
     onblur="icuesTabularGridOnblur(event,this)"
     onclick="icuesTabularGridOnclick(event, this)">
    <xsl:attribute name="id"><xsl:value-of select="$tableid"/>_<xsl:value-of select="$rowcount"/>_<xsl:value-of select="$colcount"/></xsl:attribute>
    <xsl:attribute name="onkeydown"><xsl:text>return icuesTabularGridOnkey(event,this,'</xsl:text><xsl:value-of select="$tableid"/><xsl:text>')</xsl:text></xsl:attribute>
    <xsl:apply-templates/>
  </a>
</xsl:template>

<xsl:template match="cues:taskpanelheader"> 
  <div class="cuesTaskPanel" id="cuesTaskPanelTitle">
    <nobr>
      <xsl:apply-templates/>
      &#160;
    </nobr>
  </div>
  <script>
    cuesSetTaskPanelState();
    <xsl:if test="$CUESSTYLEVERSION >= 60">
      if(cuesDrawnShape==null)cuesDrawnShape=new icuesDrawnShape();
      cuesDrawnShape.makePanel("cuesTaskPanelTitle");
    </xsl:if>
  </script>
</xsl:template>
<xsl:template match="cues:taskpaneltearoff"> 
  <a id="cuesTaskPanelTearoff" href="javascript:parent.cuesTearoffTaskPanel()">
    <xsl:attribute name="title"><xsl:value-of select="$newwindow"/></xsl:attribute>
    <img>
      <xsl:if test="$CUESSTYLEVERSION >= 60">
        <xsl:attribute name="onmouseout">return icuesSetIconHoverState(this,false)</xsl:attribute>
        <xsl:attribute name="onmouseover">return icuesSetIconHoverState(this,true)</xsl:attribute>
      </xsl:if>
      <xsl:attribute name="title"><xsl:value-of select="$newwindow"/></xsl:attribute>
      <xsl:attribute name="alt"><xsl:value-of select="$newwindow"/></xsl:attribute>
      <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/new-window_icon.gif</xsl:text></xsl:attribute>
    </img>
  </a>
</xsl:template>
<xsl:template match="cues:taskpanelcloser"> 
  <a id="cuesTaskPanelCloser" href="javascript:parent.cuesCloseTaskPanel()">
    <xsl:attribute name="title"><xsl:value-of select="$closepane"/></xsl:attribute>
    <img>
      <xsl:if test="$CUESSTYLEVERSION >= 60">
        <xsl:attribute name="onmouseout">return icuesSetIconHoverState(this,false)</xsl:attribute>
        <xsl:attribute name="onmouseover">return icuesSetIconHoverState(this,true)</xsl:attribute>
      </xsl:if>
      <xsl:attribute name="title"><xsl:value-of select="$closepane"/></xsl:attribute>
      <xsl:attribute name="alt"><xsl:value-of select="$closepane"/></xsl:attribute>
      <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/PaneRemove.gif</xsl:text></xsl:attribute>
    </img>
  </a>
</xsl:template>

<xsl:template match="cues:toolbar">
  <xsl:variable name="usage">
    <xsl:choose>
      <xsl:when test="@usage"><xsl:value-of select="@usage"/></xsl:when>
      <xsl:otherwise>content</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="id">
    <xsl:choose>
      <xsl:when test="@id"><xsl:value-of select="@id"/></xsl:when>
      <xsl:otherwise>cuesToolbar</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="height">
    <xsl:choose>
      <xsl:when test="@size='small'">28px</xsl:when>
      <xsl:otherwise>38px</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="class">
    <xsl:choose>
      <xsl:when test="$usage='table' and $CUESSTYLEVERSION >= 63">cuesToolbarTable</xsl:when>
      <xsl:when test="$usage='main' and $CUESSTYLEVERSION >= 60">cuesToolbarMain</xsl:when>
      <xsl:when test="$CUESSTYLEVERSION >= 60">cuesToolbarContent</xsl:when>
      <xsl:when test="@size='small'">cuesToolbarSmallBgGradient</xsl:when>
      <xsl:otherwise>cuesToolbarBgGradient</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <div>
    <xsl:attribute name="id"><xsl:value-of select="$id"/></xsl:attribute>
    <xsl:attribute name="class"><xsl:value-of select="$class"/></xsl:attribute>
    <xsl:if test="$CUESSTYLEVERSION &lt; 60">
      <xsl:attribute name="style"><xsl:text>width:100%;height:</xsl:text><xsl:value-of select="$height"/><xsl:text>;</xsl:text></xsl:attribute>
    </xsl:if>
    <table class="cuesToolbarContainer" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <xsl:apply-templates/>
      </tr>
    </table>
  </div>
  <xsl:if test="$CUESSTYLEVERSION >= 60 and $usage != 'table'">
    <script>
      if(cuesDrawnShape==null)cuesDrawnShape=new icuesDrawnShape();
      cuesDrawnShape.makeToolbar("cuesToolbar","<xsl:value-of select="$usage"/>");
    </script>
  </xsl:if>
</xsl:template>
<xsl:template match="cues:toolbaritem">
  <xsl:variable name="default">
    <xsl:choose>
      <xsl:when test="@menu='true' and not(@onclick)">false</xsl:when>
      <xsl:otherwise>true</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="hasmenu">
    <xsl:choose>
      <xsl:when test="@menu='true'">true</xsl:when>
      <xsl:otherwise>false</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="sizestr">
    <xsl:choose>
      <xsl:when test="../@size='small' or $CUESSTYLEVERSION >= 60">small</xsl:when>
      <xsl:otherwise>large</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="imgName">
    <xsl:choose>
      <xsl:when test="../@usage='table'">toolbarGradient3px24.gif</xsl:when>
      <xsl:when test="../@size='small' or $CUESSTYLEVERSION >= 60">toolbarGradient3px28.gif</xsl:when>
      <xsl:otherwise>toolbarGradient3px.gif</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="height">
    <xsl:choose>
      <xsl:when test="../@usage='table'">24</xsl:when>
      <xsl:when test="../@size='small' or $CUESSTYLEVERSION>=60">28</xsl:when>
      <xsl:otherwise>38</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="cellClassname">
    <xsl:choose>
      <xsl:when test="@caption">cuesToolbarCell</xsl:when>
      <xsl:otherwise>cuesToolbarEmptyCell</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="href">
    <xsl:choose>
      <xsl:when test="@disabled='true'">javascript:void(0)</xsl:when>
      <xsl:otherwise><xsl:value-of select="@onclick"/></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="imgsrc">
    <xsl:choose>
      <xsl:when test="@disabled='true'"><xsl:value-of select="@disabledimage"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="@image"/></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="imgsize">
    <xsl:choose>
      <xsl:when test="../@size='small'">16</xsl:when>
      <xsl:otherwise>24</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="caption">
    <xsl:call-template name="lookup">
      <xsl:with-param name="key" select="@caption"/>
      <xsl:with-param name="keyed" select="@captionaskey"/>
      <xsl:with-param name="locale" select="@setLocale"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="tooltip">
    <xsl:call-template name="lookup">
      <xsl:with-param name="key" select="@tooltip"/>
      <xsl:with-param name="keyed" select="@tooltipaskey"/>
      <xsl:with-param name="locale" select="@setLocale"/>
    </xsl:call-template>
  </xsl:variable>
  <td>
    <table border="0" cellpadding="0" cellspacing="0">
      <xsl:if test="../@usage='table'">
        <xsl:attribute name="class">cuesToolbarTableButton</xsl:attribute>
      </xsl:if>
      <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
      <xsl:attribute name="onMouseOver"><xsl:text>cuesMakeButton('</xsl:text><xsl:value-of select="@id"/><xsl:text>','</xsl:text><xsl:value-of select="$sizestr"/><xsl:text>',</xsl:text><xsl:value-of select="$default"/><xsl:text>,'</xsl:text><xsl:value-of select="../@usage"/> <xsl:text>');</xsl:text></xsl:attribute>
      <xsl:attribute name="onMouseOut"><xsl:text>cuesClearButton('</xsl:text><xsl:value-of select="@id"/><xsl:text>','</xsl:text><xsl:value-of select="$sizestr"/><xsl:text>',</xsl:text><xsl:value-of select="$default"/><xsl:text>,'</xsl:text><xsl:value-of select="../@usage"/><xsl:text>');</xsl:text></xsl:attribute>
      <xsl:attribute name="onMouseDown"><xsl:text>cuesMakeButtonDown('</xsl:text><xsl:value-of select="@id"/><xsl:text>','</xsl:text><xsl:value-of select="$sizestr"/><xsl:text>',</xsl:text><xsl:value-of select="$default"/><xsl:text>,'</xsl:text><xsl:value-of select="../@usage"/><xsl:text>');</xsl:text></xsl:attribute>
      <xsl:attribute name="onMouseUp"><xsl:text>cuesMakeButton('</xsl:text><xsl:value-of select="@id"/><xsl:text>','</xsl:text><xsl:value-of select="$sizestr"/><xsl:text>',</xsl:text><xsl:value-of select="$default"/><xsl:text>,'</xsl:text><xsl:value-of select="../@usage"/><xsl:text>');</xsl:text></xsl:attribute>
      <xsl:attribute name="onClick"><xsl:text>cuesToolbarItemOnclickHandler('</xsl:text><xsl:value-of select="@id"/><xsl:text>',event);</xsl:text></xsl:attribute>
      <tr>
        <td width="3">
          <img width="3" title="" alt="" style="visibility:hidden">
            <xsl:attribute name="name"><xsl:value-of select="@id"/><xsl:text>left</xsl:text></xsl:attribute>
            <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>left</xsl:text></xsl:attribute>
            <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/</xsl:text><xsl:value-of select="$imgName"/></xsl:attribute>
            <xsl:attribute name="height"><xsl:value-of select="$height"/></xsl:attribute>
          </img>
        </td>
        <td>
          <xsl:attribute name="class"><xsl:value-of select="$cellClassname"/></xsl:attribute>
          <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>center</xsl:text></xsl:attribute>
          <nobr>
            <a class="cuesToolbarLink">
              <xsl:if test="@disabled='true'">
                <xsl:attribute name="disabled">yes</xsl:attribute>
              </xsl:if>
              <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>link</xsl:text></xsl:attribute>
              <xsl:attribute name="title"><xsl:value-of select="$tooltip"/></xsl:attribute>
              <xsl:if test="@preclick">
                <xsl:attribute name="onclick"><xsl:value-of select="@preclick"/></xsl:attribute>
              </xsl:if>
              <xsl:attribute name="onblur"><xsl:text>cuesClearButton('</xsl:text><xsl:value-of select="@id"/><xsl:text>','</xsl:text><xsl:value-of select="$sizestr"/><xsl:text>',</xsl:text><xsl:value-of select="$default"/><xsl:text>);</xsl:text></xsl:attribute>
              <xsl:attribute name="href"><xsl:value-of select="$href"/></xsl:attribute>
              <xsl:attribute name="keephref"><xsl:value-of select="@onclick"/></xsl:attribute>
              <img class="cuesToolbarIcon" border="0">
                <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>image</xsl:text></xsl:attribute>
                <xsl:attribute name="title"><xsl:value-of select="$tooltip"/></xsl:attribute>
                <xsl:attribute name="alt"><xsl:value-of select="$tooltip"/></xsl:attribute>
                <xsl:attribute name="normalsrc"><xsl:value-of select="@image"/></xsl:attribute>
                <xsl:attribute name="disabledsrc"><xsl:value-of select="@disabledimage"/></xsl:attribute>
                <xsl:attribute name="src"><xsl:value-of select="$imgsrc"/></xsl:attribute>
                <xsl:if test="$CUESSTYLEVERSION &lt; 60">
                  <xsl:attribute name="width"><xsl:value-of select="$imgsize"/></xsl:attribute>
                  <xsl:attribute name="height"><xsl:value-of select="$imgsize"/></xsl:attribute>
                </xsl:if>
              </img>
              <xsl:value-of select="$caption"/>
            </a>
          </nobr>
        </td>
        <xsl:if test="$hasmenu='true'">
          <xsl:if test="$default='true'">
            <td>
              <img width="3" title="" alt="">
                <xsl:attribute name="name"><xsl:value-of select="@id"/><xsl:text>separator</xsl:text></xsl:attribute>
                <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>separator</xsl:text></xsl:attribute>
                <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/</xsl:text><xsl:value-of select="$imgName"/></xsl:attribute>
                <xsl:attribute name="height"><xsl:value-of select="$height"/></xsl:attribute>
              </img>
            </td>
          </xsl:if>
          <td>
            <xsl:attribute name="class"><xsl:text>cuesToolbarDropdownCell</xsl:text><xsl:if test="@disabled='true'"><xsl:text>Disabled</xsl:text></xsl:if></xsl:attribute>
            <xsl:attribute name="onclick"><xsl:text>cuesShowToolbarItemMenu('</xsl:text><xsl:value-of select="@id"/><xsl:text>',event)</xsl:text></xsl:attribute>
            <xsl:if test="$default='false'">
              <xsl:attribute name="style">padding-right:3px;</xsl:attribute>
            </xsl:if>
            <a class="cuesToolbarLink">
              <xsl:if test="@disabled='true'">
                <xsl:attribute name="disabled">yes</xsl:attribute>
              </xsl:if>
              <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>dropdown</xsl:text></xsl:attribute>
              <xsl:attribute name="title"><xsl:value-of select="$tooltip"/></xsl:attribute>
              <xsl:if test="@preclick">
                <xsl:attribute name="onclick"><xsl:value-of select="@preclick"/></xsl:attribute>
              </xsl:if>
              <xsl:attribute name="href">
                <xsl:choose>
                  <xsl:when test="@disabled='true'">javascript:void(0);</xsl:when>
                  <xsl:otherwise><xsl:text>javascript:cuesShowToolbarItemMenu('</xsl:text><xsl:value-of select="@id"/><xsl:text>');</xsl:text></xsl:otherwise>
                </xsl:choose>
              </xsl:attribute>
              <xsl:attribute name="keephref"><xsl:text>javascript:cuesShowToolbarItemMenu('</xsl:text><xsl:value-of select="@id"/><xsl:text>');</xsl:text></xsl:attribute>
              <img border="0">
                <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>dropdownimage</xsl:text></xsl:attribute>
                <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/benu-arrow</xsl:text><xsl:if test="@disabled='true'"><xsl:text>-disabled</xsl:text></xsl:if><xsl:text>.gif</xsl:text></xsl:attribute>
                <xsl:attribute name="title"><xsl:value-of select="$submenu"/></xsl:attribute>
                <xsl:attribute name="alt"><xsl:value-of select="$submenu"/></xsl:attribute>
              </img>
            </a>
          </td>
        </xsl:if>          
        <td width="3">
          <img width="3" title="" alt="" style="visibility:hidden">
            <xsl:attribute name="name"><xsl:value-of select="@id"/><xsl:text>right</xsl:text></xsl:attribute>
            <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>right</xsl:text></xsl:attribute>
            <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/</xsl:text><xsl:value-of select="$imgName"/></xsl:attribute>
            <xsl:attribute name="height"><xsl:value-of select="$height"/></xsl:attribute>
          </img>
        </td>
      </tr>
    </table>
    <xsl:if test="@disabled='true'">
      <script>
        <xsl:text>cuesDisableToolbarItem('</xsl:text><xsl:value-of select="@id"/><xsl:text>',</xsl:text><xsl:value-of select="$hasmenu"/><xsl:text>);</xsl:text>
      </script>
    </xsl:if>
    <xsl:if test="$hasmenu='true'">
      <div style="padding:1px;display:none;position:absolute;">
        <xsl:attribute name="id"><xsl:value-of select="@id"/><xsl:text>menu</xsl:text></xsl:attribute>
        <ul>
          <xsl:attribute name="class">
            <xsl:text>cuesButtonMenu</xsl:text>
            <xsl:if test="$ISIE='1'"><xsl:text> cuesButtonMenuIE</xsl:text></xsl:if>
          </xsl:attribute>
          <xsl:apply-templates/>
        </ul>
      </div>
    </xsl:if>
  </td>
</xsl:template>
<xsl:template match="cues:toolbarspacer">
  <td width="100%">&#160;</td>
</xsl:template>
<xsl:template match="cues:toolbarfield">
  <td class="cuesToolbarField">
    <xsl:apply-templates/>
  </td>
</xsl:template>
<xsl:template match="cues:toolbarseparator">
  <td>
    <img alt="" title="" style="margin:0 1px;" width="2">
      <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/><xsl:text>cues_images/toolbarButtonDownTile.gif</xsl:text></xsl:attribute>
      <xsl:attribute name="height">
        <xsl:choose>
          <xsl:when test="../@size='small'">24</xsl:when>
          <xsl:otherwise>34</xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
    </img>
  </td>
</xsl:template>

<xsl:template match="cues:transferbox">
  <xsl:variable name="numvisible">
    <xsl:choose>
      <xsl:when test="@numvisible"><xsl:value-of select="@numvisible"/></xsl:when>
      <xsl:otherwise>10</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="action">
    <xsl:choose>
      <xsl:when test="@action"><xsl:value-of select="@action"/></xsl:when>
      <xsl:otherwise>move</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="width">
    <xsl:choose>
      <xsl:when test="@width"><xsl:value-of select="@width"/></xsl:when>
      <xsl:otherwise>130px</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="minwidth">
    <xsl:choose>
      <xsl:when test="@width='*'"><xsl:value-of select="@minwidth"/></xsl:when>
      <xsl:otherwise></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <table cellpadding="0" cellspacing="0">
    <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
    <tr>
      <xsl:attribute name="extracount"><xsl:value-of select="@numextra"/></xsl:attribute>
      <td>
        <xsl:attribute name="width"><xsl:value-of select="$width"/></xsl:attribute>
        <label>
          <xsl:attribute name="for"><xsl:value-of select="@id"/><xsl:text>choices</xsl:text></xsl:attribute>
        <nobr>
          <xsl:call-template name="lookup">
            <xsl:with-param name="key" select="@choiceslabel"/>
            <xsl:with-param name="keyed" select="@labelaskey"/>
            <xsl:with-param name="locale" select="@setLocale"/>
          </xsl:call-template>
        </nobr>
        </label>
      </td>
      <xsl:if test="@numextra>0">
        <td>
          <xsl:attribute name="colspan"><xsl:value-of select="@numextra"/></xsl:attribute>
          <xsl:text>&#160;</xsl:text>
        </td>
      </xsl:if>
      <td width="40px">
        <xsl:text>&#160;</xsl:text>
      </td>
      <td>
        <xsl:attribute name="width"><xsl:value-of select="$width"/></xsl:attribute>
        <label>
          <xsl:attribute name="for"><xsl:value-of select="@id"/><xsl:text>chosen</xsl:text></xsl:attribute>
        <nobr>
          <xsl:call-template name="lookup">
            <xsl:with-param name="key" select="@chosenlabel"/>
            <xsl:with-param name="keyed" select="@labelaskey"/>
            <xsl:with-param name="locale" select="@setLocale"/>
          </xsl:call-template>
        </nobr>
        </label>
      </td>
      <xsl:if test="@autosort='user'">
        <td width="40px"><xsl:text>&#160;</xsl:text></td>
      </xsl:if>
    </tr>
    <tr>
      <xsl:attribute name="extracount"><xsl:value-of select="@numextra"/></xsl:attribute>
      <xsl:apply-templates select="cues:transferchoices">
        <xsl:with-param name="numvisible" select="$numvisible"/>
        <xsl:with-param name="action" select="$action"/>
        <xsl:with-param name="width" select="$width"/>
        <xsl:with-param name="minwidth" select="$minwidth"/>
      </xsl:apply-templates>
      <td valign="center" align="center" style="vertical-align:middle;">
        <div>
          <button type="button" class="cuesButton cueesTransferboxButton" disabled="yes">
            <xsl:attribute name="id"><xsl:value-of select="@id"/>right</xsl:attribute>
            <xsl:attribute name="onclick">cuesTransfer('<xsl:value-of select="@id"/>','Right','selected','<xsl:value-of select="@autosort"/>','<xsl:value-of select="$action"/>','0')</xsl:attribute>
            <xsl:attribute name="title"><xsl:value-of select="$moveright"/></xsl:attribute>
            <img>
              <xsl:attribute name="title"><xsl:value-of select="$moveright"/></xsl:attribute>
              <xsl:attribute name="alt"><xsl:value-of select="$moveright"/></xsl:attribute>
              <xsl:attribute name="id"><xsl:value-of select="@id"/>rightimg</xsl:attribute>
              <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/MoveRight16T-D.gif</xsl:attribute>
            </img>
          </button>
          <br/>
          <button type="button" class="cuesButton cueesTransferboxButton" disabled="yes">
            <xsl:attribute name="id"><xsl:value-of select="@id"/>left</xsl:attribute>
            <xsl:attribute name="onclick">cuesTransfer('<xsl:value-of select="@id"/>','Left','selected','<xsl:value-of select="@autosort"/>','<xsl:value-of select="$action"/>','0')</xsl:attribute>
            <xsl:attribute name="title"><xsl:value-of select="$moveleft"/></xsl:attribute>
            <img>
              <xsl:attribute name="title"><xsl:value-of select="$moveleft"/></xsl:attribute>
              <xsl:attribute name="alt"><xsl:value-of select="$moveleft"/></xsl:attribute>
              <xsl:attribute name="id"><xsl:value-of select="@id"/>leftimg</xsl:attribute>
              <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/MoveLeft16T-D.gif</xsl:attribute>
            </img>
          </button>
          <br/>
          <br/>
          <br/>
          <button type="button" class="cuesButton cueesTransferboxButton" disabled="yes">
            <xsl:attribute name="id"><xsl:value-of select="@id"/>rightall</xsl:attribute>
            <xsl:attribute name="onclick">cuesTransfer('<xsl:value-of select="@id"/>','Right','all','<xsl:value-of select="@autosort"/>','<xsl:value-of select="$action"/>','0')</xsl:attribute>
            <xsl:attribute name="title"><xsl:value-of select="$moveallright"/></xsl:attribute>
            <img>
              <xsl:attribute name="title"><xsl:value-of select="$moveallright"/></xsl:attribute>
              <xsl:attribute name="alt"><xsl:value-of select="$moveallright"/></xsl:attribute>
              <xsl:attribute name="id"><xsl:value-of select="@id"/>rightallimg</xsl:attribute>
              <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/MoveAllRight16T-D.gif</xsl:attribute>
            </img>
          </button>
          <br/>
          <button type="button" class="cuesButton cueesTransferboxButton" disabled="yes">
            <xsl:attribute name="id"><xsl:value-of select="@id"/>leftall</xsl:attribute>
            <xsl:attribute name="onclick">cuesTransfer('<xsl:value-of select="@id"/>','Left','all','<xsl:value-of select="@autosort"/>','<xsl:value-of select="$action"/>','0')</xsl:attribute>
            <xsl:attribute name="title"><xsl:value-of select="$moveallleft"/></xsl:attribute>
            <img>
              <xsl:attribute name="title"><xsl:value-of select="$moveallleft"/></xsl:attribute>
              <xsl:attribute name="alt"><xsl:value-of select="$moveallleft"/></xsl:attribute>
              <xsl:attribute name="id"><xsl:value-of select="@id"/>leftallimg</xsl:attribute>
              <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/MoveAllLeft16T-D.gif</xsl:attribute>
            </img>
          </button>
        </div>
      </td>
      <xsl:apply-templates select="cues:transferchosen">
        <xsl:with-param name="numvisible" select="$numvisible"/>
        <xsl:with-param name="action" select="$action"/>
        <xsl:with-param name="width" select="$width"/>
        <xsl:with-param name="minwidth" select="$minwidth"/>
      </xsl:apply-templates>
      <xsl:if test="@autosort='user'">
        <td valign="center" align="center" style="vertical-align:middle;">
          <div>
            <button type="button" class="cuesButton cueesTransferboxButton" disabled="yes">
              <xsl:attribute name="id"><xsl:value-of select="@id"/>top</xsl:attribute>
              <xsl:attribute name="onclick">cuesTransfer('<xsl:value-of select="@id"/>','to','top','user')</xsl:attribute>
              <xsl:attribute name="title"><xsl:value-of select="$movetotop"/></xsl:attribute>
              <img>
                <xsl:attribute name="title"><xsl:value-of select="$movetotop"/></xsl:attribute>
                <xsl:attribute name="alt"><xsl:value-of select="$movetotop"/></xsl:attribute>
                <xsl:attribute name="id"><xsl:value-of select="@id"/>topimg</xsl:attribute>
                <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/MoveToTop12T-D.gif</xsl:attribute>
              </img>
            </button>
            <br/>
            <br/>
            <button type="button" class="cuesButton cueesTransferboxButton" disabled="yes">
              <xsl:attribute name="id"><xsl:value-of select="@id"/>up</xsl:attribute>
              <xsl:attribute name="onclick">cuesTransfer('<xsl:value-of select="@id"/>','to','up','user')</xsl:attribute>
              <xsl:attribute name="title"><xsl:value-of select="$moveup"/></xsl:attribute>
              <img>
                <xsl:attribute name="title"><xsl:value-of select="$moveup"/></xsl:attribute>
                <xsl:attribute name="alt"><xsl:value-of select="$moveup"/></xsl:attribute>
                <xsl:attribute name="id"><xsl:value-of select="@id"/>upimg</xsl:attribute>
                <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/MoveUp12T-D.gif</xsl:attribute>
              </img>
            </button>
            <br/>
            <button type="button" class="cuesButton cueesTransferboxButton" disabled="yes">
              <xsl:attribute name="id"><xsl:value-of select="@id"/>down</xsl:attribute>
              <xsl:attribute name="onclick">cuesTransfer('<xsl:value-of select="@id"/>','to','down','user')</xsl:attribute>
              <xsl:attribute name="title"><xsl:value-of select="$movedown"/></xsl:attribute>
              <img>
                <xsl:attribute name="title"><xsl:value-of select="$movedown"/></xsl:attribute>
                <xsl:attribute name="alt"><xsl:value-of select="$movedown"/></xsl:attribute>
                <xsl:attribute name="id"><xsl:value-of select="@id"/>downimg</xsl:attribute>
                <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/MoveDown12T-D.gif</xsl:attribute>
              </img>
            </button>
            <br/>
            <br/>
            <button type="button" class="cuesButton cueesTransferboxButton" disabled="yes">
              <xsl:attribute name="id"><xsl:value-of select="@id"/>bottom</xsl:attribute>
              <xsl:attribute name="onclick">cuesTransfer('<xsl:value-of select="@id"/>','to','bottom','user')</xsl:attribute>
              <xsl:attribute name="title"><xsl:value-of select="$movetobottom"/></xsl:attribute>
              <img>
                <xsl:attribute name="title"><xsl:value-of select="$movetobottom"/></xsl:attribute>
                <xsl:attribute name="alt"><xsl:value-of select="$movetobottom"/></xsl:attribute>
                <xsl:attribute name="id"><xsl:value-of select="@id"/>bottomimg</xsl:attribute>
                <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_images/MoveToBottom12T-D.gif</xsl:attribute>
              </img>
            </button>
          </div>
        </td>
      </xsl:if>
    </tr>
  </table>
  <script>
    <xsl:text>icuesDetermineTransferAllStates('</xsl:text><xsl:value-of select="@id"/><xsl:text>');</xsl:text>
    <xsl:text>icuesDetermineTransferMinWidth('</xsl:text><xsl:value-of select="@id"/><xsl:text>');</xsl:text>
  </script>
</xsl:template>
<xsl:template match="cues:transferchoices">
  <xsl:param name="numvisible"/>
  <xsl:param name="action"/>
  <xsl:param name="width"/>
  <xsl:param name="minwidth"/>
  <td>
    <select multiple="yes">
      <xsl:attribute name="minwidth"><xsl:value-of select="$minwidth"/></xsl:attribute>
      <xsl:attribute name="style"><xsl:text>width:</xsl:text><xsl:value-of select="$width"/></xsl:attribute>
      <xsl:attribute name="ondblclick"><xsl:text>cuesTransfer('</xsl:text><xsl:value-of select="../@id"/><xsl:text>','Right','one','</xsl:text><xsl:value-of select="../@autosort"/><xsl:text>','</xsl:text><xsl:value-of select="$action"/><xsl:text>')</xsl:text></xsl:attribute>
      <xsl:attribute name="onchange"><xsl:text>setTimeout('cuesTransferOnClick(\'</xsl:text><xsl:value-of select="../@id"/><xsl:text>\',\'choices\')',100)</xsl:text></xsl:attribute>
      <xsl:if test="../@disabled='true'">
        <xsl:attribute name="disabled">true</xsl:attribute>
      </xsl:if>
      <xsl:attribute name="id"><xsl:value-of select="../@id"/><xsl:text>choices</xsl:text></xsl:attribute>
      <xsl:attribute name="name"><xsl:value-of select="../@id"/><xsl:text>choices</xsl:text></xsl:attribute>
      <xsl:attribute name="size">
        <xsl:value-of select="$numvisible"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </select>
  </td>
</xsl:template>
<xsl:template match="cues:transferchosen">
  <xsl:param name="numvisible"/>
  <xsl:param name="action"/>
  <xsl:param name="width"/>
  <xsl:param name="minwidth"/>
  <td>
    <select multiple="yes">
      <xsl:attribute name="minwidth"><xsl:value-of select="$minwidth"/></xsl:attribute>
      <xsl:attribute name="style"><xsl:text>width:</xsl:text><xsl:value-of select="$width"/></xsl:attribute>
      <xsl:attribute name="ondblclick"><xsl:text>cuesTransfer('</xsl:text><xsl:value-of select="../@id"/><xsl:text>','Left','one','</xsl:text><xsl:value-of select="../@autosort"/><xsl:text>','</xsl:text><xsl:value-of select="$action"/><xsl:text>')</xsl:text></xsl:attribute>
      <xsl:attribute name="onchange"><xsl:text>setTimeout('cuesTransferOnClick(\'</xsl:text><xsl:value-of select="../@id"/><xsl:text>\',\'chosen\')',100)</xsl:text></xsl:attribute>
      <xsl:if test="../@disabled='true'">
        <xsl:attribute name="disabled">true</xsl:attribute>
      </xsl:if>
      <xsl:attribute name="id"><xsl:value-of select="../@id"/><xsl:text>chosen</xsl:text></xsl:attribute>
      <xsl:attribute name="name"><xsl:value-of select="../@id"/><xsl:text>chosen</xsl:text></xsl:attribute>
      <xsl:attribute name="size">
        <xsl:value-of select="$numvisible"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </select>
  </td>

</xsl:template>
<xsl:template match="cues:transferextrafield">
</xsl:template>


<!-- cues:wizardtitle -->
<xsl:template match="cues:wizardtitle" mode="standalone">
  <xsl:variable name="count" select="count(preceding-sibling::cues:wizardtitle)"/>
  <div>
    <xsl:attribute name="id"><xsl:value-of select="../@id"/><xsl:text>_title</xsl:text><xsl:value-of select="$count"/></xsl:attribute>
    <xsl:attribute name="class"><xsl:text>cuesWizardTitle</xsl:text><xsl:if test="$count > 0"><xsl:text>Hidden</xsl:text></xsl:if></xsl:attribute>
    <xsl:choose>
      <xsl:when test="count(descendant::*) > 0 or string-length(.) > 0">
        <xsl:apply-templates/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:attribute name="style"><xsl:text>margin-top:0px;margin-bottom:0px;</xsl:text></xsl:attribute>
        <xsl:text>&#160;</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </div>
</xsl:template>
<xsl:template match="cues:wizardtitle" mode="inpage">
  <xsl:variable name="count" select="count(preceding-sibling::cues:wizardtitle)"/>
  <div>
    <xsl:attribute name="id"><xsl:value-of select="../@id"/><xsl:text>_title</xsl:text><xsl:value-of select="$count"/></xsl:attribute>
    <xsl:attribute name="class"><xsl:text>cuesWizardTitleInpage</xsl:text><xsl:if test="$count > 0"><xsl:text>Hidden</xsl:text></xsl:if></xsl:attribute>
    <xsl:choose>
      <xsl:when test="count(descendant::*) > 0 or string-length(.) > 0">
        <xsl:apply-templates/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:attribute name="style"><xsl:text>margin-top:0px;margin-bottom:0px;</xsl:text></xsl:attribute>
        <xsl:text>&#160;</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </div>
</xsl:template>

<!-- cues:wizardcontent -->
<xsl:template match="cues:wizardcontent" mode="standalone">
  <xsl:variable name="count" select="count(preceding-sibling::cues:wizardcontent)"/>
  <div>
    <xsl:attribute name="id"><xsl:value-of select="../@id"/><xsl:text>_content</xsl:text><xsl:value-of select="$count"/></xsl:attribute>
    <xsl:attribute name="class">
      <xsl:text>cuesWizardContent</xsl:text>
      <xsl:if test="$count > 0"><xsl:text>Hidden</xsl:text></xsl:if>
      </xsl:attribute>
    <xsl:apply-templates/>
  </div>
</xsl:template>
<xsl:template match="cues:wizardcontent" mode="inpage">
  <xsl:variable name="count" select="count(preceding-sibling::cues:wizardcontent)"/>
  <div>
    <xsl:attribute name="id"><xsl:value-of select="../@id"/><xsl:text>_content</xsl:text><xsl:value-of select="$count"/></xsl:attribute>
    <xsl:attribute name="class">
      <xsl:text>cuesWizardContentInpage</xsl:text>
      <xsl:if test="$count > 0"><xsl:text>Hidden</xsl:text></xsl:if>
      </xsl:attribute>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<!-- cues:wizardnav name= backvalue= nextvalue= finishvalue= finishtext= cancelonlick= helponclick= -->
<xsl:template match="cues:wizardnav" mode="standalone">
  <table cellspacing="5" cellpadding="0" id="cuesWizardNav" border="0" width="100%">
    <tr>
      <td width="100%" align="right">
        <button type="button" class="cuesButton" id="cuesWizardBackButton">
            <xsl:attribute name="onclick"><xsl:value-of select="@backvalue"/></xsl:attribute>
            <xsl:choose>
              <xsl:when test="not(@backvalue)"><xsl:attribute name="disabled"><xsl:text>yes</xsl:text></xsl:attribute></xsl:when>
              <xsl:when test="@backvalue=''"><xsl:attribute name="disabled"><xsl:text>yes</xsl:text></xsl:attribute></xsl:when>
              <xsl:when test="count(../cues:wizardtitle) > 1"><xsl:attribute name="disabled"><xsl:text>yes</xsl:text></xsl:attribute></xsl:when>
            </xsl:choose>
          <xsl:value-of select="$back"/>
        </button>
      </td>    
      <xsl:if test="@nextvalue">
        <td>
          <button type="button" class="cuesButton" id="cuesWizardNextButton">
            <xsl:attribute name="onclick"><xsl:value-of select="@nextvalue"/></xsl:attribute>
            <xsl:value-of select="$next"/>
          </button>
        </td>
      </xsl:if>  
      <xsl:if test="@finishvalue">
        <td>
          <button type="button" class="cuesButton" id="cuesWizardFinishButton">
            <xsl:attribute name="onclick"><xsl:value-of select="@finishvalue"/></xsl:attribute>
            <xsl:call-template name="lookup">
              <xsl:with-param name="key" select="@finishtext"/>
              <xsl:with-param name="keyed" select="@finishtextaskey"/>
              <xsl:with-param name="locale" select="../@setLocale"/>
            </xsl:call-template>
          </button>
        </td>
      </xsl:if>  
      <xsl:if test="@cancelonclick">
        <td>
          <button type="button" class="cuesButton" id="cuesWizardCancelButton">
            <xsl:attribute name="onclick"><xsl:value-of select="@cancelonclick"/></xsl:attribute>
            <xsl:value-of select="$cancel"/>
          </button>
        </td>
      </xsl:if>  
      <xsl:if test="@helponclick and $CUESSTYLEVERSION &lt; 60">
        <td>
          <button type="button" class="cuesButton" id="cuesWizardHelpButton">
            <xsl:attribute name="onclick"><xsl:value-of select="@helponclick"/></xsl:attribute>
            <xsl:value-of select="$help"/>
          </button>
        </td>
      </xsl:if>  
    </tr>
  </table>
</xsl:template>
<xsl:template match="cues:wizardnav" mode="inpage">
  <table cellspacing="5" cellpadding="0" id="cuesWizardNav" border="0" width="100%">
    <tr>
      <td width="100%" align="right">
        <button type="button" class="cuesButton" id="cuesWizardBackButton">
            <xsl:attribute name="onclick"><xsl:value-of select="@backvalue"/></xsl:attribute>
            <xsl:choose>
              <xsl:when test="not(@backvalue)"><xsl:attribute name="disabled"><xsl:text>yes</xsl:text></xsl:attribute></xsl:when>
              <xsl:when test="@backvalue=''"><xsl:attribute name="disabled"><xsl:text>yes</xsl:text></xsl:attribute></xsl:when>
              <xsl:when test="count(../cues:wizardtitle) > 1"><xsl:attribute name="disabled"><xsl:text>yes</xsl:text></xsl:attribute></xsl:when>
            </xsl:choose>
          <xsl:value-of select="$back"/>
        </button>
      </td>    
      <xsl:if test="@nextvalue">
        <td>
          <button type="button" class="cuesButton" id="cuesWizardNextButton">
            <xsl:attribute name="onclick"><xsl:value-of select="@nextvalue"/></xsl:attribute>
            <xsl:value-of select="$next"/>
          </button>
        </td>
      </xsl:if>  
      <xsl:if test="@finishvalue">
        <td>
          <button type="button" class="cuesButton" id="cuesWizardFinishButton">
            <xsl:attribute name="onclick"><xsl:value-of select="@finishvalue"/></xsl:attribute>
            <xsl:call-template name="lookup">
              <xsl:with-param name="key" select="@finishtext"/>
              <xsl:with-param name="keyed" select="@finishtextaskey"/>
              <xsl:with-param name="locale" select="../@setLocale"/>
            </xsl:call-template>
          </button>
        </td>
      </xsl:if>  
      <xsl:if test="@cancelonclick">
        <td>
          <button type="button" class="cuesButton" id="cuesWizardCancelButton">
            <xsl:attribute name="onclick"><xsl:value-of select="@cancelonclick"/></xsl:attribute>
            <xsl:value-of select="$cancel"/>
          </button>
        </td>
      </xsl:if>  
    </tr>
  </table>
</xsl:template>

<!-- cues:wizardstep state=active/completed/future haserrrors=true/false caption=string -->
<xsl:template match="cues:wizardstep" mode="standalone">
  <xsl:variable name="count" select="count(preceding-sibling::cues:wizardstep)+1"/>
  <xsl:variable name="which" select="count(preceding-sibling::cues:wizardstep)"/>
  <br/>
  <div>
    <xsl:attribute name="inerror">
      <xsl:choose>
        <xsl:when test="@haserrors='true'">true</xsl:when>
      </xsl:choose>
    </xsl:attribute>
    <xsl:attribute name="class">
      <xsl:text>cuesWizardStep</xsl:text><xsl:value-of select="@state"/>
      <xsl:if test="@haserrors='true'"><xsl:text>error</xsl:text></xsl:if>
    </xsl:attribute>
    <xsl:attribute name="id">
      <xsl:value-of select="../../@id"/><xsl:text>.step</xsl:text><xsl:value-of select="$which"/>
    </xsl:attribute>
    <xsl:if test="@conditional">
      <xsl:attribute name="conditional"><xsl:value-of select="@conditional"/></xsl:attribute>
      <xsl:if test="@conditional='true'">
        <xsl:attribute name="style"><xsl:text>display:none;</xsl:text></xsl:attribute>
      </xsl:if>
    </xsl:if>
    <xsl:if test="@haserrors='true' and $CUESSTYLEVERSION &lt; 60">
      <img title="Step has error(s)" alt="Step has error(s)">
        <xsl:attribute name="src"><xsl:value-of select="$CUESKNOWNLOCATION"/>cues_icons/statuserror_12.gif</xsl:attribute>
      </img>
    </xsl:if>
    <xsl:if test="$CUESSTYLEVERSION &lt; 60">
      <xsl:value-of select="$count"/><xsl:text> - </xsl:text>
    </xsl:if>
    <xsl:call-template name="lookup">
      <xsl:with-param name="key" select="@caption"/>
      <xsl:with-param name="keyed" select="@captionaskey"/>
      <xsl:with-param name="locale" select="../../@setLocale"/>
    </xsl:call-template>
  </div>
</xsl:template>
<xsl:template match="cues:wizardstep" mode="inpage">
  <xsl:variable name="count" select="count(preceding-sibling::cues:wizardstep)+1"/>
  <xsl:variable name="which" select="count(preceding-sibling::cues:wizardstep)"/>
  <div>
    <xsl:attribute name="inerror">
      <xsl:choose>
        <xsl:when test="@haserrors='true'">true</xsl:when>
      </xsl:choose>
    </xsl:attribute>
    <xsl:attribute name="class">
      <xsl:text>cuesWizardStepInpage</xsl:text><xsl:value-of select="@state"/>
      <xsl:if test="@haserrors='true'"><xsl:text>error</xsl:text></xsl:if>
    </xsl:attribute>
    <xsl:attribute name="id">
      <xsl:value-of select="../../@id"/><xsl:text>.step</xsl:text><xsl:value-of select="$which"/>
    </xsl:attribute>
    <xsl:if test="@conditional">
      <xsl:attribute name="conditional"><xsl:value-of select="@conditional"/></xsl:attribute>
    </xsl:if>
    <xsl:call-template name="lookup">
      <xsl:with-param name="key" select="@caption"/>
      <xsl:with-param name="keyed" select="@captionaskey"/>
      <xsl:with-param name="locale" select="../../@setLocale"/>
    </xsl:call-template>
  </div>
</xsl:template>

<!-- cues:wizardsteps width=# -->
<xsl:template match="cues:wizardsteps" mode="standalone">
  <td valign="top" class="cuesWizardLeftPane">
    <xsl:attribute name="width"><xsl:value-of select="@width"/></xsl:attribute>
    <xsl:apply-templates mode="standalone"/>
    <span id="cuesWizardStepsMarker"><xsl:text> </xsl:text></span>
  </td>
</xsl:template>
<xsl:template match="cues:wizardsteps" mode="inpage">
  <div id="cuesWizardStepsInpage">
    <span style="display:none">
      <xsl:attribute name="id"><xsl:value-of select="../@id"/>.beforeStepNames</xsl:attribute>
      <xsl:text>...</xsl:text></span>
    <xsl:apply-templates mode="inpage"/>
    <span style="display:none">
      <xsl:attribute name="id"><xsl:value-of select="../@id"/>.afterStepNames</xsl:attribute>
      <xsl:text>...</xsl:text></span>
  </div>
</xsl:template>

<!-- cues:wizard id=foo -->
<xsl:template match="cues:wizard">
  <xsl:choose>
    <xsl:when test="@standalone='true' or $CUESSTYLEVERSION &lt; 60">
      <table class="cuesWizardPane" style="table-layout:fixed" id="cuesWizardPane" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <xsl:apply-templates select="cues:wizardsteps" mode="standalone"/>          
          <td valign="top" class="cuesWizardContentPane">
            <xsl:apply-templates select="cues:wizardtitle" mode="standalone"/>
            <xsl:apply-templates select="cues:wizardcontent" mode="standalone"/>
            <xsl:if test="$CUESSTYLEVERSION &lt; 60">
              <xsl:apply-templates select="cues:wizardnav" mode="standalone"/>
            </xsl:if>
          </td>
        </tr>
      </table>
      <xsl:if test="$CUESSTYLEVERSION >= 60">
        <xsl:apply-templates select="cues:wizardnav" mode="standalone"/>
        <script>cuesExpandHeight("cuesWizardPane",50);</script>
      </xsl:if>
    </xsl:when>
    <xsl:otherwise>
      <div class="cuesWizardPaneInpage" id="cuesWizardPane" width="100%">
        <xsl:apply-templates select="cues:wizardsteps" mode="inpage"/>
        <xsl:apply-templates select="cues:wizardtitle" mode="inpage"/>
        <xsl:apply-templates select="cues:wizardcontent" mode="inpage"/>
      </div>
      <xsl:apply-templates select="cues:wizardnav" mode="inpage"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="starttablecell">
  <xsl:param name="colspan"/>
  <xsl:param name="class"/>
  <xsl:call-template name="starttag"/>
  <xsl:text>td class="</xsl:text><xsl:value-of select="$class"/><xsl:text>" colspan="</xsl:text><xsl:value-of select="$colspan"/><xsl:text>"</xsl:text>
  <xsl:call-template name="endtag"/>
</xsl:template>
<xsl:template name="endtablecell">
  <xsl:call-template name="starttag"/>
  <xsl:text>/td</xsl:text>
  <xsl:call-template name="endtag"/>
</xsl:template>
<xsl:template name="starttablerow">
  <xsl:call-template name="starttag"/>
  <xsl:text>tr</xsl:text>
  <xsl:call-template name="endtag"/>
</xsl:template>
<xsl:template name="endtablerow">
  <xsl:call-template name="starttag"/>
  <xsl:text>/tr</xsl:text>
  <xsl:call-template name="endtag"/>
</xsl:template>

<xsl:template name="escapeOnclick">
  <xsl:param name="stringIn"/>
  <xsl:variable name="charsIn">'</xsl:variable>
  <xsl:choose>
    <xsl:when test="contains($stringIn,$charsIn)">
      <xsl:value-of select="substring-before($stringIn,$charsIn)"/>
      <xsl:choose>
        <xsl:when test="$ISSAFARI='1'"><xsl:text disable-output-escaping="yes">%26apos;</xsl:text></xsl:when>
        <xsl:otherwise><xsl:text disable-output-escaping="yes">&amp;apos;</xsl:text></xsl:otherwise>
      </xsl:choose>
      <xsl:call-template name="escapeOnclick">
        <xsl:with-param name="stringIn" select="substring-after($stringIn,$charsIn)"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$stringIn"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="escapeEmbedded">
  <xsl:param name="stringIn"/>
  <xsl:variable name="charsIn">'</xsl:variable>
  <xsl:choose>
    <xsl:when test="contains($stringIn,$charsIn)">
      <xsl:value-of select="substring-before($stringIn,$charsIn)"/>
      <xsl:text disable-output-escaping="yes">&#x005c;&#x0027;</xsl:text>
      <xsl:call-template name="escapeEmbedded">
        <xsl:with-param name="stringIn" select="substring-after($stringIn,$charsIn)"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$stringIn"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="escapeAsXML">
  <xsl:param name="stringIn"/>
  <xsl:value-of select="translate($stringIn,'&quot;','&amp;quot;')"/>
</xsl:template>

<xsl:template match="cues:starttag">
  <xsl:call-template name="starttag"/>
</xsl:template>
<xsl:template match="cues:endtag">
  <xsl:call-template name="endtag"/>
</xsl:template>

<xsl:template name="starttag">
  <xsl:choose>
    <xsl:when test="$ISIE='1'"><xsl:text disable-output-escaping="yes">&lt;</xsl:text></xsl:when>
    <xsl:otherwise><xsl:text>&amp;lt;</xsl:text></xsl:otherwise>
  </xsl:choose>
</xsl:template>
<xsl:template name="endtag">
  <xsl:choose>
    <xsl:when test="$ISIE='1'"><xsl:text disable-output-escaping="yes">&gt;</xsl:text></xsl:when>
    <xsl:otherwise><xsl:text>&amp;gt;</xsl:text></xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="buildnumericoption">
  <xsl:param name="value"/>
  <xsl:param name="incr"/>
  <xsl:param name="limit"/>
  <xsl:param name="selected" select="-999"/>
  <option>
    <xsl:attribute name="value"><xsl:value-of select="$value"/></xsl:attribute>
    <xsl:if test="number($value) + number($incr) = number($selected)">
      <xsl:attribute name="checked">true</xsl:attribute>
      <xsl:attribute name="selected">true</xsl:attribute>
    </xsl:if>
    <xsl:if test="10 > ($value + $incr)">0</xsl:if>
    <xsl:value-of select="$value + $incr"/>
  </option>
  <xsl:if test="$limit > $value + 1">
    <xsl:call-template name="buildnumericoption">
      <xsl:with-param name="value"><xsl:value-of select="$value+1"/></xsl:with-param>
      <xsl:with-param name="incr" select="$incr"/>
      <xsl:with-param name="limit" select="$limit"/>
      <xsl:with-param name="selected" select="$selected"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

<xsl:template name="lookup">
  <xsl:param name="key"/>
  <xsl:param name="keyed">false</xsl:param>
  <xsl:param name="locale"/>
  <xsl:choose>
    <xsl:when test="$keyed='true'">
      <xsl:choose>

        <xsl:when test="$APPSTRINGSDOC//cueslookup:name[@key=$key][@lang=$locale]">
          <xsl:choose>
            <xsl:when test="$APPSTRINGSDOC//cueslookup:name[@key=$key][@lang=$locale]/*">
              <xsl:copy-of select="$APPSTRINGSDOC//cueslookup:name[@key=$key][@lang=$locale]/*"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$APPSTRINGSDOC//cueslookup:name[@key=$key][@lang=$locale]"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:when test="$APPSTRINGSDOC//cueslookup:name[@key=$key][@lang=$LOCALE]">
          <xsl:choose>
            <xsl:when test="$APPSTRINGSDOC//cueslookup:name[@key=$key][@lang=$LOCALE]/*">
              <xsl:copy-of select="$APPSTRINGSDOC//cueslookup:name[@key=$key][@lang=$LOCALE]/*"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$APPSTRINGSDOC//cueslookup:name[@key=$key][@lang=$LOCALE]"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:when test="$APPSTRINGSDOC//cueslookup:name[@key=$key][not(@lang)]">
          <xsl:choose>
            <xsl:when test="$APPSTRINGSDOC//cueslookup:name[@key=$key][not(@lang)]/*">
              <xsl:copy-of select="$APPSTRINGSDOC//cueslookup:name[@key=$key][not(@lang)]/*"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$APPSTRINGSDOC//cueslookup:name[@key=$key][not(@lang)]"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:when test="$APPSTRINGSDOC//cueslookup:name[@key=$key]">
          <xsl:choose>
            <xsl:when test="$APPSTRINGSDOC//cueslookup:name[@key=$key]/*">
              <xsl:copy-of select="$APPSTRINGSDOC//cueslookup:name[@key=$key]/*"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$APPSTRINGSDOC//cueslookup:name[@key=$key]"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>

        <xsl:when test="$BRANDSTRINGSDOC//cueslookup:name[@key=$key][@lang=$locale]">
          <xsl:choose>
            <xsl:when test="$BRANDSTRINGSDOC//cueslookup:name[@key=$key][@lang=$locale]/*">
              <xsl:copy-of select="$BRANDSTRINGSDOC//cueslookup:name[@key=$key][@lang=$locale]/*"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$BRANDSTRINGSDOC//cueslookup:name[@key=$key][@lang=$locale]"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:when test="$BRANDSTRINGSDOC//cueslookup:name[@key=$key][@lang=$LOCALE]">
          <xsl:choose>
            <xsl:when test="$BRANDSTRINGSDOC//cueslookup:name[@key=$key][@lang=$LOCALE]/*">
              <xsl:copy-of select="$BRANDSTRINGSDOC//cueslookup:name[@key=$key][@lang=$LOCALE]/*"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$BRANDSTRINGSDOC//cueslookup:name[@key=$key][@lang=$LOCALE]"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:when test="$BRANDSTRINGSDOC//cueslookup:name[@key=$key][not(@lang)]">
          <xsl:choose>
            <xsl:when test="$BRANDSTRINGSDOC//cueslookup:name[@key=$key][not(@lang)]/*">
              <xsl:copy-of select="$BRANDSTRINGSDOC//cueslookup:name[@key=$key][not(@lang)]/*"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$BRANDSTRINGSDOC//cueslookup:name[@key=$key][not(@lang)]"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:when test="$BRANDSTRINGSDOC//cueslookup:name[@key=$key]">
          <xsl:choose>
            <xsl:when test="$BRANDSTRINGSDOC//cueslookup:name[@key=$key]/*">
              <xsl:copy-of select="$BRANDSTRINGSDOC//cueslookup:name[@key=$key]/*"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$BRANDSTRINGSDOC//cueslookup:name[@key=$key]"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>

        <xsl:when test="$CUESSTRINGSDOC//*[@name=$key]">
          <xsl:choose>
            <xsl:when test="$CUESSTRINGSDOC//*[@name=$key]/*">
              <xsl:copy-of select="$CUESSTRINGSDOC//*[@name=$key]/*"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$CUESSTRINGSDOC//*[@name=$key]"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>

        <xsl:when test="$ISSAFARI='1' and document('')//cueslookup:name[@key=$key][@lang=$locale]">
          <xsl:choose>
            <xsl:when test="$ISSAFARI='1' and document('')//cueslookup:name[@key=$key][@lang=$locale]/*">
              <xsl:copy-of select="document('')//cueslookup:name[@key=$key][@lang=$locale]/*"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="document('')//cueslookup:name[@key=$key][@lang=$locale]"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:when test="$ISSAFARI='1' and document('')//cueslookup:name[@key=$key][@lang=$LOCALE]">
          <xsl:choose>
            <xsl:when test="$ISSAFARI='1' and document('')//cueslookup:name[@key=$key][@lang=$LOCALE]/*">
              <xsl:copy-of select="document('')//cueslookup:name[@key=$key][@lang=$LOCALE]/*"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="document('')//cueslookup:name[@key=$key][@lang=$LOCALE]"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:when test="$ISSAFARI='1' and document('')//cueslookup:name[@key=$key][not(@lang)]">
          <xsl:choose>
            <xsl:when test="$ISSAFARI='1' and document('')//cueslookup:name[@key=$key][not(@lang)]/*">
              <xsl:copy-of select="document('')//cueslookup:name[@key=$key][not(@lang)]/*"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="document('')//cueslookup:name[@key=$key][not(@lang)]"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:when test="$ISSAFARI='1' and document('')//cueslookup:name[@key=$key]">
          <xsl:choose>
            <xsl:when test="$ISSAFARI='1' and document('')//cueslookup:name[@key=$key]/*">
              <xsl:copy-of select="document('')//cueslookup:name[@key=$key]/*"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="document('')//cueslookup:name[@key=$key]"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
          
        <xsl:otherwise>
          <xsl:value-of select="$key"/>
        </xsl:otherwise>
      </xsl:choose>      
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$key"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="addARIA">
  <xsl:attribute name="role">region</xsl:attribute>
  <xsl:attribute name="aria-live">polite</xsl:attribute>
  <xsl:attribute name="aria-atomic">true</xsl:attribute>
  <xsl:attribute name="aria-relevant">additions</xsl:attribute>
</xsl:template>

<xsl:template match="xhtml:*"> 
  <xsl:element name="{local-name(.)}">
    <xsl:for-each select="@*">
      <xsl:attribute name="{name(.)}">
        <xsl:value-of select="."/>
      </xsl:attribute>
    </xsl:for-each>
    <xsl:apply-templates/>
  </xsl:element>
</xsl:template>

<xsl:template match="@*|node()">
  <xsl:copy>
    <xsl:copy-of select="@*"/>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="@*|node()" mode="dump">
  <xsl:copy><xsl:copy-of select="@*"/><xsl:apply-templates select="@*|node()" mode="dump"/></xsl:copy><xsl:text></xsl:text>
</xsl:template>

</xsl:stylesheet>

