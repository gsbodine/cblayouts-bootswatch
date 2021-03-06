﻿<cfoutput>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>
		<cfif cb.isEntryView()>
			#cb.getCurrentEntry().getTitle()#
		<cfelse>
			#cb.siteName()# - #cb.siteTagLine()#
		</cfif>
		</title>
		<meta name="generator" 	 content="ContentBox powered by ColdBox" />
		<meta name="robots" 	 content="index,follow" />
		<meta name="author" content="">
		<!--- Meta per page or index --->
		<cfif cb.isEntryView() AND len(cb.getCurrentEntry().getHTMLDescription())>
			<meta name="description" content="#cb.getCurrentEntry().getHTMLDescription()#" />
		<cfelse>
			<meta name="description" content="#HTMLEditFormat( cb.siteDescription() )#" />
		</cfif>
		<cfif cb.isEntryView() AND len(cb.getCurrentEntry().getHTMLKeywords())>
			<meta name="keywords" 	 content="#cb.getCurrentEntry().getHTMLKeywords()#" />
		<cfelse>
			<meta name="keywords" 	 content="#cb.siteKeywords()#" />
		</cfif>

		<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<!--- Base HREF For SES URLs based on ColdBox--->
		<base href="#getSetting('htmlBaseURL')#" />

		<!--- Bootstrap --->
		<link rel="stylesheet" href="#cb.layoutRoot()#/includes/css/bootstrap/swatches/#lcase(cb.layoutsetting('bootswatchTheme','default'))#/bootstrap.min.css?v=1" />

		<!--- Font Awesome --->
		<link rel="stylesheet" href="#cb.layoutRoot()#/includes/css/font-awesome/font-awesome.min.css?v=1" />
		<link rel="stylesheet" href="#cb.layoutRoot()#/includes/css/font-awesome/font-awesome-ie7.min.css?v=1" />

		<!--- Minify & Cache Our Assets --->
		<cfif cb.layoutsetting('minifyCacheAssets',true)>
			<!--- Use LESS --->
			<cfif cb.layoutsetting('useLESS',true)>
				#cb.minify(assets="#cb.layoutRoot()#/includes/css/less/blog.less,#cb.layoutRoot()#/includes/css/less/messagebox.less,#cb.layoutRoot()#/includes/css/less/paging.less,#cb.layoutRoot()#/includes/css/less/breadcrumbs.less", location="#cb.layoutRoot()#/includes/css")#
			<cfelse>
				#cb.minify(assets="#cb.layoutRoot()#/includes/css/main.css", location="#cb.layoutRoot()#/includes/css")#
			</cfif>
		<cfelse>
			<!--- Include our unminified, unLESSified, non cached version of the stylesheet --->
			<link rel="stylesheet" href="#cb.layoutRoot()#/includes/css/main.css?v=1" />
		</cfif>

		<!--- RSS Stuff --->
		<link rel="alternate" type="application/rss+xml" title="Recent Updates" href="#cb.linkRSS()#" />
		<cfif cb.isEntryView()>
			<link rel="alternate" type="application/rss+xml" title="Entry's Recent Comments" href="#cb.linkRSS(comments=true,entry=cb.getCurrentEntry())#" />
		</cfif>

		<!--- ContentBoxEvent --->
		#cb.event("cbui_beforeHeadEnd")#
	</head>
	<body>
		<!--- ContentBoxEvent --->
		#cb.event("cbui_afterBodyStart")#

		<div class="container">

			#cb.quickView(view='_header')#

			<!--- <cfif not getPlugin("messagebox").isEmpty()>
				<div class="row-fluid">
					<div class="span12">
						#cb.getPlugin("messagebox").renderit()#
					</div>
				</div>
			</cfif> --->

			<div class="row-fluid">
				<div class="span12">
					<!--- ContentBoxEvent --->
					#cb.event("cbui_beforeContent")#

					<!--- Content --->
					#renderView()#

					<!--- ContentBoxEvent --->
					#cb.event("cbui_afterContent")#
				</div>
			</div>

			<hr>

			#cb.quickView(view='_footer')#

		</div>

	</body>

	<!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
	<script type="text/javascript" src="#cb.layoutRoot()#/includes/js/bootstrap/bootstrap.min.js"></script>
</html>
</cfoutput>