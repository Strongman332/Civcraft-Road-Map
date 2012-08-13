﻿<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
	<!--
	CivCraft Nether Roads Map
	https://github.com/hpoom/Nether-Roads-Map
	
	Town/Portal List
	-->
	<svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="1800" height="1900">
		<style type="text/css">
		<![CDATA[

			circle.portal {
				stroke: black;
				stroke-width: 1.5;
				fill: lightcyan;
			}
			
			text.portal {
				fill: black;
				font-size: 17px;
				font-weight: bold;
				text-anchor: middle;
			}
			
			text.portal_small {
				fill: black;
				font-size: 15px;
				font-weight: bold;
				text-anchor: middle;
			}

			text.portal_name {
				fill: black;
				font-size: 17px;
				font-weight: bold;
			}
			
			
			text.compass {
				fill: black;
				font-size: 28px;
				font-weight: bold;
				font-variant: small-caps;
				text-anchor: middle;
			}
			
			polygon.compass {
				fill: cyan;
				stroke: black;
				stroke-width: 2;
			}
			
			polygon.compass_north {
				fill: cyan;
				stroke: black;
				stroke-width: 1;
			}
			
			text.scale {
				fill: black;
				font-size: 12px;
				font-weight: bold;
			}
			
			text.scale_right {
				fill: black;
				font-size: 12px;
				font-weight: bold;
				text-anchor: end;
			}
			
			rect.scale_light {
				fill: white;
				stroke: black;
				stroke-width: 1;
			}
			
			rect.scale_dark {
				fill: cyan;
				stroke: black;
				stroke-width: 1;
			}
			
			line.road {
				stroke: #444;
				stroke-width: 2.5;
			}
			
			rect.background {
				fill: white;
				stroke: lightgreen;
				stroke-width: 1.5;
			}
			
			text.range {
				fill: green;
				font-size: 11px;
				text-anchor: middle;
			}
			
			text.range_v {
				fill: green;
				font-size: 11px;
				text-anchor: end;
			}
		]]>
		</style>
		
		
		<!-- Background -->
		<defs>
			<pattern id="background" width="100" height="100" patternUnits="userSpaceOnUse">
				<rect class="background" x="0" y="0" width="101" height="101" />
			</pattern>
		</defs>
		
		<rect fill="url(#background)" x="0" y="0" width="100%" height="100%"/>
		
		<!-- Key -->
		<g transform="translate(920, 1420) scale(.9)">
			<defs>
				<linearGradient id="key_gradient" x1="0%" y1="0%" x2="100%" y2="0%">
					<stop offset="0%" style="stop-color:rgb(255,255,0);stop-opacity:1" />
					<stop offset="90%" style="stop-color:rgb(255,255,0);stop-opacity:.4" />
					<stop offset="100%" style="stop-color:rgb(255,255,0);stop-opacity:.0" />
				</linearGradient>
			</defs>
			<rect x="-20" y="-20" width="740" height="545" fill="url(#key_gradient)" />
			
			<xsl:for-each select="map/portals/portal">
				<xsl:variable name="i"><xsl:number /></xsl:variable>
				<xsl:variable name="x" select="floor(($i - 1) div 15.0)" />
				<xsl:variable name="y" select="($i - 1) - ($x * 15.0)" />
				<g>
					<xsl:attribute name="transform">
						<xsl:value-of select="concat('translate(',180 * $x,',',36 * $y,')')" />
					</xsl:attribute>
					<circle class="portal" r="16" />
					<text y="5">
						<xsl:attribute name="class">
							<xsl:if test="string-length(@abbr) &gt; 2">portal_small</xsl:if>
							<xsl:if test="string-length(@abbr) &lt; 3">portal</xsl:if>
						</xsl:attribute>
						<xsl:value-of select="@abbr" />
					</text>
					<text class="portal_name" x="25" y="5"><xsl:value-of select="@name" /></text>
				</g>
			</xsl:for-each>
		
		</g>
		
		
		<!-- Compass and Scale -->
		<g transform="translate(150, 150)">
			<text class="compass" y="-72">North</text>
			<g transform="translate(0, 20)">
				<polygon class="compass_north" transform="translate(0, -10) rotate(180,0,-40) scale(2.0)" points="0,0 -20,-20 -17,-23 -3,-9 -3,-40 3,-40 3,-9 17,-23 20,-20" />
				<polygon class="compass" transform="translate(10, 25) rotate(270,0,-40)" points="0,0 -20,-20 -17,-23 -3,-9 -3,-40 3,-40 3,-9 17,-23 20,-20" />
				<polygon class="compass" transform="translate(0,  35) rotate(  0,0,-40)" points="0,0 -20,-20 -17,-23 -3,-9 -3,-40 3,-40 3,-9 17,-23 20,-20" />
				<polygon class="compass" transform="translate(-10,25) rotate( 90,0,-40)" points="0,0 -20,-20 -17,-23 -3,-9 -3,-40 3,-40 3,-9 17,-23 20,-20" />
			</g>
			<g transform="translate(72,35)">
				<rect class="scale_light" x="0" width="10" height="10" />
				<rect class="scale_dark" x="10" width="10" height="10" />
				<rect class="scale_light" x="20" width="10" height="10" />
				<rect class="scale_dark" x="30" width="10" height="10" />
				<rect class="scale_light" x="40" width="10" height="10" />
				<rect class="scale_dark" x="50" width="10" height="10" />
				<rect class="scale_light" x="60" width="10" height="10" />
				<rect class="scale_dark" x="70" width="10" height="10" />
				<rect class="scale_light" x="80" width="10" height="10" />
				<rect class="scale_dark" x="90" width="10" height="10" />
				<rect class="scale_dark" y="-10" width="10" height="10" />
				<rect class="scale_light" y="-20" width="10" height="10" />
				<rect class="scale_dark" y="-30" width="10" height="10" />
				<rect class="scale_light" y="-40" width="10" height="10" />
				<rect class="scale_dark" y="-50" width="10" height="10" />
				<rect class="scale_light" y="-60" width="10" height="10" />
				<rect class="scale_dark" y="-70" width="10" height="10" />
				<rect class="scale_light" y="-80" width="10" height="10" />
				<rect class="scale_dark" y="-90" width="10" height="10" />
				<text class="scale" x="0" y="24">0 Meters</text>
				<text class="scale_right" x="100" y="24">100</text>
			</g>
		</g>
		
		<!--
			Change this translation to subtract the top left portal of the map.
			If the top left corner is 50, 70 then this translation should be
			-50, -70; likewise 200, -4400 is a translation of -200, 4400.
			
			If you want it to line up with the grid, make it a multiple of 100
			(or the grid size).

			Remember to check the width and height of the SVG at the top.
		-->
		<g transform="translate(1200,1000)">
		
			<!-- Range indicators -->
			<g transform="translate(0,-980)">
				<text class="range" x="-1100">-1100</text>
				<text class="range" x="-1000">-1000</text>
				<text class="range" x="-900">-900</text>
				<text class="range" x="-800">-800</text>
				<text class="range" x="-700">-700</text>
				<text class="range" x="-600">-600</text>
				<text class="range" x="-500">-500</text>
				<text class="range" x="-400">-400</text>
				<text class="range" x="-300">-300</text>
				<text class="range" x="-200">-200</text>
				<text class="range" x="-100">-100</text>
				<text class="range" x="0">0</text>
				<text class="range" x="100">+100</text>
				<text class="range" x="200">+200</text>
				<text class="range" x="300">+300</text>
				<text class="range" x="400">+400</text>
				<text class="range" x="500">+500</text>
			</g>
			<g transform="translate(590,4)">
				<text class="range_v" y="-900">-900</text>
				<text class="range_v" y="-800">-800</text>
				<text class="range_v" y="-700">-700</text>
				<text class="range_v" y="-600">-600</text>
				<text class="range_v" y="-500">-500</text>
				<text class="range_v" y="-400">-400</text>
				<text class="range_v" y="-300">-300</text>
				<text class="range_v" y="-200">-200</text>
				<text class="range_v" y="-100">-100</text>
				<text class="range_v" y="0">0</text>
				<text class="range_v" y="100">+100</text>
				<text class="range_v" y="200">+200</text>
				<text class="range_v" y="300">+300</text>
				<text class="range_v" y="400">+400</text>
				<text class="range_v" y="500">+500</text>
				<text class="range_v" y="600">+600</text>
				<text class="range_v" y="700">+700</text>
				<text class="range_v" y="800">+800</text>
			</g>
		
			<!-- Roads -->
			<g>
				<line class="road" x1="-1180" y1="-545" x2="409" y2="-545" /><!-- North Road -->
				<line class="road" x1="-1180" y1="-545" x2="-1180" y2="-273" /><!-- North Road/Vilvos -->
				<line class="road" x1="-1178" y1="-272" x2="-1180" y2="-273" /><!-- North Road/Vilvos -->
				<line class="road" x1="-1178" y1="-151" x2="-1178" y2="-272" /><!-- North Road/Vilvos -->
				<line class="road" x1="-1169" y1="-151" x2="-1178" y2="-151" /><!-- North Road/Vilvos -->
				<line class="road" x1="-1169" y1="-151" x2="-1169" y2="-158" /><!-- North Road/Vilvos -->
				<line class="road" x1="409" y1="-518" x2="409" y2="-545" /><!-- North Road/Lazuli -->
				<line class="road" x1="57" y1="-376" x2="57" y2="-545" /><!-- North Road/Hoyt -->
				<line class="road" x1="-1061" y1="-709" x2="-1061" y2="-492" /><!-- Tokiestan/Immelopolis -->
				<line class="road" x1="-821"  y1="-448" x2="-821" y2="-545" /><!-- North Road/Derpenshire -->
				<line class="road" x1="-1082" y1="-492" x2="-1061" y2="-492" /><!-- North Road/Tokiestan -->
				<line class="road" x1="-981" y1="-263" x2="-981" y2="-545" /><!-- North Road/Cutlasso's Fort -->
				<line class="road" x1="-981" y1="-263" x2="-863" y2="-145" /><!-- Cutlasso's Fort/Io -->
				<line class="road" x1="-889" y1="-171" x2="-841" y2="-171" /><!-- Cutlasso's Fort/Io -->
				<line class="road" x1="-863" y1="-145" x2="-467" y2="-145" /><!-- Io/Saga Road -->
				<line class="road" x1="-777"  y1="-895" x2="-777" y2="-545" /><!-- North Road/Central City -->
				<line class="road" x1="-777"  y1="-831" x2="-701" y2="-831" /><!-- Prisma -->
				<line class="road" x1="-777"  y1="-750" x2="-614" y2="-587" /><!-- Central City / Mt Augusta -->
				<line class="road" x1="-715"  y1="-721" x2="-715" y2="-679" /><!-- Yellow Flower -->
				<line class="road" x1="-777"  y1="-679" x2="-706" y2="-679" /><!-- Yellow Flower / Mt Augusta -->
				<line class="road" x1="-741"  y1="-714" x2="-741" y2="-766" /><!-- Avernum -->
				<line class="road" x1="-614"  y1="-621" x2="-616" y2="258" /><!-- Mt Augusta Road  -->
				<line class="road" x1="-614"  y1="-540" x2="-159" y2="-84" /><!-- Mt Augusta Road / Liberty -->
				<line class="road" x1="-538"  y1="-464" x2="-538" y2="-417" /><!-- Alpha Sierra -->
				<line class="road" x1="-159" y1="-58" x2="328" y2="-545" /><!-- Liberty/Lazuli Road -->
				<line class="road" x1="-159" y1="-84" x2="-159" y2="-1" /><!-- Hub road near Liberty -->
				<line class="road" x1="-357" y1="-36" x2="-467" y2="-145" /><!-- Saga/Avalon -->
				<line class="road" x1="-357" y1="-143" x2="-357" y2="-1" /><!-- Saga/Avalon -->
				<line class="road" x1="-357" y1="-143" x2="-385" y2="-143" /><!-- Epicus/Avalon -->
				<line class="road" x1="-357" y1="-1" x2="0" y2="-1" /><!-- Avalon/0,0 -->
				<line class="road" x1="0" y1="-136" x2="0" y2="-1" /><!-- Rothbard/0,0 -->
				<line class="road" x1="-920" y1="289" x2="-645" y2="289" /><!-- Atmora Road -->
				<line class="road" x1="-357" y1="1" x2="-725" y2="369" /><!-- Avalon/Columbia Road -->
				<line class="road" x1="-737" y1="369" x2="-725" y2="369" /><!-- Avalon/Columbia Road Leg 1 -->
				<line class="road" x1="-737" y1="369" x2="-811" y2="443" /><!-- Avalon/Columbia Road Leg 2 -->
				<line class="road" x1="-811" y1="493" x2="-811" y2="443" /><!-- Avalon/Columbia Road Leg 3 -->
				<line class="road" x1="-436" y1="79" x2="-436" y2="308" /><!-- JH/OP North/South road -->
				<line class="road" x1="-664" y1="306" x2="-436" y2="308" /><!-- JH East/West road -->
				<line class="road" x1="0" y1="-1" x2="191" y2="-187" /><!-- 0,0/Road Kink -->
				<line class="road" x1="191" y1="-187" x2="395" y2="-263" /><!-- Road Kink/Cress -->
				<line class="road" x1="395" y1="-263" x2="413" y2="-263" /><!-- Cress Road -->
				<line class="road" x1="395" y1="-263" x2="418" y2="-291" /><!-- Cress Junction -->
				<line class="road" x1="418" y1="-291" x2="418" y2="-430" /><!-- Old Rift Road -->
				<line class="road" x1="418" y1="-430" x2="439" y2="-457" /><!-- Old Rift Road -->
				<line class="road" x1="439" y1="-457" x2="408" y2="-457" /><!-- Lazuli Road -->
				<line class="road" x1="408" y1="-457" x2="410" y2="-545" /><!-- Lazuli Road -->
				<line class="road" x1="23" y1="-240" x2="78" y2="-187" /><!-- TGS Road -->
				<line class="road" x1="78" y1="-187" x2="191" y2="-187" /><!-- TGS Road -->
				<line class="road" x1="16" y1="4" x2="0" y2="4" /><!-- Constantinople Road -->
				<line class="road" x1="16" y1="4" x2="558" y2="546" /><!-- Constantinople Road -->
				<line class="road" x1="540" y1="398" x2="410" y2="398" /><!-- Gerald Road -->
				<line class="road" x1="243" y1="231" x2="490" y2="231" /><!-- Communa Road -->
				<line class="road" x1="162" y1="149" x2="399" y2="149" /><!-- Kodiak Road -->
				<line class="road" x1="0" y1="0" x2="0" y2="18" /><!-- Kizantium Road -->
				<line class="road" x1="0" y1="18" x2="-575" y2="593" /><!-- Kizantium Road -->
				<line class="road" x1="-575" y1="593" x2="-575" y2="748" /><!-- Kizantium Road -->
				<line class="road" x1="-639" y1="756" x2="-639" y2="741" /><!-- Piedmont Road -->
				<line class="road" x1="-639" y1="756" x2="-518" y2="756" /><!-- Piedmont/Bjornstahl Road -->
				<line class="road" x1="-518" y1="756" x2="-468" y2="806" /><!-- Bjornstahl Road -->
				<line class="road" x1="-468" y1="806" x2="-457" y2="806" /><!-- Bjornstahl Road -->
				<line class="road" x1="-575" y1="707" x2="-591" y2="707" /><!-- Kizantium/Columbia Road -->
				<line class="road" x1="-591" y1="707" x2="-787" y2="512" /><!-- Kizantium/Columbia Road -->
				<line class="road" x1="-787" y1="512" x2="-810" y2="512" /><!-- Kizantium/Columbia Road -->
				<line class="road" x1="-810" y1="512" x2="-810" y2="492" /><!-- Kizantium/Columbia Road -->
				<line class="road" x1="-800" y1="511" x2="-800" y2="593" /><!-- Alexandria Road -->
				<line class="road" x1="-810" y1="480" x2="-685" y2="480" /><!-- Rapture Road -->
				<line class="road" x1="-714" y1="358" x2="-714" y2="399" /><!-- Leningrad Road -->
				<line class="road" x1="-592" y1="237" x2="-244" y2="237" /><!-- Obsidian Plains Road -->
				<line class="road" x1="-237" y1="237" x2="-237" y2="255" /><!-- Vanahiemer Road -->
				<line class="road" x1="-244" y1="237" x2="-244" y2="0" /><!-- Vanahiemer Road -->
				<line class="road" x1="-614" y1="92" x2="-665" y2="92" /><!-- Sovngarde Road -->
				<line class="road" x1="-980" y1="-321" x2="-916" y2="-321" /><!-- Icengrad Road -->
				
			</g>
			
			<!-- Portals -->
			<g>
				<xsl:for-each select="map/portals/portal">
					<g>
						<xsl:attribute name="transform">
							<xsl:value-of select="concat('translate(',@x,',',@z,')')" />
						</xsl:attribute>
						<circle class="portal" r="16" />
						<text y="5">
							<xsl:attribute name="class">
								<xsl:if test="string-length(@abbr) &gt; 2">portal_small</xsl:if>
								<xsl:if test="string-length(@abbr) &lt; 3">portal</xsl:if>
							</xsl:attribute>
							<xsl:value-of select="@abbr" />
						</text>
					</g>
				</xsl:for-each>
			</g>
		</g>

	</svg>
</xsl:template>
</xsl:stylesheet> 

