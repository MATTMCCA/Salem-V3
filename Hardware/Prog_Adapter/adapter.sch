<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.6.2">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="yes" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="16" fill="1" visible="no" active="no"/>
<layer number="3" name="Route3" color="17" fill="1" visible="no" active="no"/>
<layer number="4" name="Route4" color="18" fill="1" visible="no" active="no"/>
<layer number="5" name="Route5" color="19" fill="1" visible="no" active="no"/>
<layer number="6" name="Route6" color="25" fill="1" visible="no" active="no"/>
<layer number="7" name="Route7" color="26" fill="1" visible="no" active="no"/>
<layer number="8" name="Route8" color="27" fill="1" visible="no" active="no"/>
<layer number="9" name="Route9" color="28" fill="1" visible="no" active="no"/>
<layer number="10" name="Route10" color="29" fill="1" visible="no" active="no"/>
<layer number="11" name="Route11" color="30" fill="1" visible="no" active="no"/>
<layer number="12" name="Route12" color="20" fill="1" visible="no" active="no"/>
<layer number="13" name="Route13" color="21" fill="1" visible="no" active="no"/>
<layer number="14" name="Route14" color="22" fill="1" visible="no" active="no"/>
<layer number="15" name="Route15" color="23" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="24" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="0532610671" urn="urn:adsk.eagle:library:29729274">
<packages>
<package name="0532610671" urn="urn:adsk.eagle:footprint:29729276/1" library_version="3">
<smd name="1" x="-3.125" y="0.8" dx="1.6" dy="0.8" layer="1" rot="R90"/>
<smd name="2" x="-1.875" y="0.8" dx="1.6" dy="0.8" layer="1" rot="R90"/>
<smd name="3" x="-0.625" y="0.8" dx="1.6" dy="0.8" layer="1" rot="R90"/>
<smd name="4" x="0.625" y="0.8" dx="1.6" dy="0.8" layer="1" rot="R90"/>
<smd name="5" x="1.875" y="0.8" dx="1.6" dy="0.8" layer="1" rot="R90"/>
<smd name="6" x="3.125" y="0.8" dx="1.6" dy="0.8" layer="1" rot="R90"/>
<smd name="7" x="-5.675" y="-2.1" dx="3" dy="2.1" layer="1" rot="R90"/>
<smd name="8" x="5.67" y="-2.1" dx="3" dy="2.1" layer="1" rot="R90"/>
<wire x1="4.625" y1="-4.2" x2="-4.625" y2="-4.2" width="0.1524" layer="51"/>
<wire x1="-4.625" y1="0" x2="-4.625" y2="-1.15625" width="0.1524" layer="51"/>
<wire x1="-4.625" y1="-1.15625" x2="-4.625" y2="-3.8" width="0.1524" layer="51"/>
<wire x1="-4.625" y1="-3.8" x2="-4.625" y2="-4.2" width="0.1524" layer="51"/>
<wire x1="4.625" y1="0" x2="4.625" y2="-1.15625" width="0.1524" layer="51"/>
<wire x1="4.625" y1="-1.15625" x2="4.625" y2="-3.8" width="0.1524" layer="51"/>
<wire x1="4.625" y1="-3.8" x2="4.625" y2="-4.2" width="0.1524" layer="51"/>
<wire x1="-4.625" y1="0" x2="4.625" y2="0" width="0.1524" layer="51"/>
<wire x1="-6.325" y1="-1.15625" x2="-4.625" y2="-1.15625" width="0.1524" layer="51"/>
<wire x1="-6.325" y1="-1.15625" x2="-6.325" y2="-3.8" width="0.1524" layer="51"/>
<wire x1="-6.325" y1="-3.8" x2="-4.625" y2="-3.8" width="0.1524" layer="21"/>
<wire x1="4.625" y1="-1.15625" x2="6.325" y2="-1.15625" width="0.1524" layer="51"/>
<wire x1="6.325" y1="-1.15625" x2="6.325" y2="-3.8" width="0.1524" layer="51"/>
<wire x1="6.325" y1="-3.8" x2="4.625" y2="-3.8" width="0.1524" layer="51"/>
<wire x1="-6.325" y1="-3.8" x2="-4.625" y2="-3.8" width="0.1524" layer="51"/>
<wire x1="6.325" y1="-3.8" x2="4.625" y2="-3.8" width="0.1524" layer="21"/>
<wire x1="4.625" y1="-4.2" x2="-4.625" y2="-4.2" width="0.1524" layer="21"/>
<wire x1="-4.625" y1="-3.8" x2="-4.625" y2="-4.2" width="0.1524" layer="21"/>
<wire x1="4.625" y1="-3.8" x2="4.625" y2="-4.2" width="0.1524" layer="21"/>
<wire x1="-4.046875" y1="0" x2="-4.625" y2="0" width="0.1524" layer="21"/>
<wire x1="4.046875" y1="0" x2="4.625" y2="0" width="0.1524" layer="21"/>
<text x="-6.35" y="5.08" size="1.778" layer="25">&gt;NAME</text>
<text x="-6.35" y="2.54" size="1.778" layer="27">&gt;VALUE</text>
</package>
</packages>
<packages3d>
<package3d name="0532610671" urn="urn:adsk.eagle:package:29729278/2" type="model" library_version="8">
<packageinstances>
<packageinstance name="0532610671"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="0532610671_OP" urn="urn:adsk.eagle:symbol:30454624/1" library_version="8">
<pin name="SWCLK" x="-5.08" y="5.08" length="middle"/>
<pin name="SWDIO" x="-5.08" y="2.54" length="middle"/>
<pin name="!RST" x="-5.08" y="0" length="middle"/>
<pin name="GND" x="-5.08" y="-2.54" length="middle"/>
<pin name="VCC" x="-5.08" y="-5.08" length="middle"/>
<pin name="VREF" x="-5.08" y="-7.62" length="middle"/>
<wire x1="0" y1="7.62" x2="0" y2="-10.16" width="0.1524" layer="94"/>
<wire x1="0" y1="-10.16" x2="12.7" y2="-10.16" width="0.1524" layer="94"/>
<wire x1="12.7" y1="-10.16" x2="12.7" y2="7.62" width="0.1524" layer="94"/>
<wire x1="12.7" y1="7.62" x2="0" y2="7.62" width="0.1524" layer="94"/>
<text x="-5.08" y="12.7" size="1.778" layer="95">&gt;NAME</text>
<text x="-5.08" y="10.16" size="1.778" layer="96">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="0532610671_OP" urn="urn:adsk.eagle:component:30454625/2" prefix="PROG" uservalue="yes" library_version="8">
<gates>
<gate name="G$1" symbol="0532610671_OP" x="0" y="0"/>
</gates>
<devices>
<device name="" package="0532610671">
<connects>
<connect gate="G$1" pin="!RST" pad="3"/>
<connect gate="G$1" pin="GND" pad="4"/>
<connect gate="G$1" pin="SWCLK" pad="1"/>
<connect gate="G$1" pin="SWDIO" pad="2"/>
<connect gate="G$1" pin="VCC" pad="5"/>
<connect gate="G$1" pin="VREF" pad="6"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:29729278/2"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="supply1" urn="urn:adsk.eagle:library:371">
<description>&lt;b&gt;Supply Symbols&lt;/b&gt;&lt;p&gt;
 GND, VCC, 0V, +5V, -5V, etc.&lt;p&gt;
 Please keep in mind, that these devices are necessary for the
 automatic wiring of the supply signals.&lt;p&gt;
 The pin name defined in the symbol is identical to the net which is to be wired automatically.&lt;p&gt;
 In this library the device names are the same as the pin names of the symbols, therefore the correct signal names appear next to the supply symbols in the schematic.&lt;p&gt;
 &lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="GND" urn="urn:adsk.eagle:symbol:26925/1" library_version="1">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="GND" urn="urn:adsk.eagle:component:26954/1" prefix="GND" library_version="1">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="STM32_SFH11-PBPC-D10-ST-BK_" urn="urn:adsk.eagle:library:29732539">
<packages>
<package name="CONN_SFH11-PBPC-D10-ST-BK_SUL" urn="urn:adsk.eagle:footprint:29732540/1" library_version="1">
<pad name="1" x="0" y="0" drill="0.8636" diameter="1.3716"/>
<pad name="2" x="0" y="-2.54" drill="0.8636" diameter="1.3716"/>
<pad name="3" x="2.54" y="0" drill="0.8636" diameter="1.3716"/>
<pad name="4" x="2.54" y="-2.54" drill="0.8636" diameter="1.3716"/>
<pad name="5" x="5.08" y="0" drill="0.8636" diameter="1.3716"/>
<pad name="6" x="5.08" y="-2.54" drill="0.8636" diameter="1.3716"/>
<pad name="7" x="7.62" y="0" drill="0.8636" diameter="1.3716"/>
<pad name="8" x="7.62" y="-2.54" drill="0.8636" diameter="1.3716"/>
<pad name="9" x="10.16" y="0" drill="0.8636" diameter="1.3716"/>
<pad name="10" x="10.16" y="-2.54" drill="0.8636" diameter="1.3716"/>
<pad name="11" x="12.7" y="0" drill="0.8636" diameter="1.3716"/>
<pad name="12" x="12.7" y="-2.54" drill="0.8636" diameter="1.3716"/>
<pad name="13" x="15.24" y="0" drill="0.8636" diameter="1.3716"/>
<pad name="14" x="15.24" y="-2.54" drill="0.8636" diameter="1.3716"/>
<pad name="15" x="17.78" y="0" drill="0.8636" diameter="1.3716"/>
<pad name="16" x="17.78" y="-2.54" drill="0.8636" diameter="1.3716"/>
<pad name="17" x="20.32" y="0" drill="0.8636" diameter="1.3716"/>
<pad name="18" x="20.32" y="-2.54" drill="0.8636" diameter="1.3716"/>
<pad name="19" x="22.86" y="0" drill="0.8636" diameter="1.3716"/>
<pad name="20" x="22.86" y="-2.54" drill="0.8636" diameter="1.3716"/>
<wire x1="-3.937" y1="-4.3942" x2="9.58" y2="-4.3942" width="0.1524" layer="21"/>
<wire x1="9.58" y1="-4.3942" x2="13.28" y2="-4.3942" width="0.1524" layer="21"/>
<wire x1="13.28" y1="-4.3942" x2="26.797" y2="-4.3942" width="0.1524" layer="21"/>
<wire x1="26.797" y1="-4.3942" x2="26.797" y2="1.8542" width="0.1524" layer="21"/>
<wire x1="26.797" y1="1.8542" x2="-3.937" y2="1.8542" width="0.1524" layer="21"/>
<wire x1="-3.937" y1="1.8542" x2="-3.937" y2="-4.3942" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-4.2672" x2="26.67" y2="-4.2672" width="0.1524" layer="51"/>
<wire x1="26.67" y1="-4.2672" x2="26.67" y2="1.7272" width="0.1524" layer="51"/>
<wire x1="26.67" y1="1.7272" x2="-3.81" y2="1.7272" width="0.1524" layer="51"/>
<wire x1="-3.81" y1="1.7272" x2="-3.81" y2="-4.2672" width="0.1524" layer="51"/>
<wire x1="9.58" y1="-5.39" x2="13.28" y2="-5.39" width="0.1524" layer="21"/>
<wire x1="9.58" y1="-5.39" x2="9.58" y2="-4.3942" width="0.1524" layer="21"/>
<wire x1="13.28" y1="-5.39" x2="13.28" y2="-4.3942" width="0.1524" layer="21"/>
<text x="8.1534" y="3.175" size="1.27" layer="25" ratio="6" rot="SR0">&gt;Name</text>
<text x="8.4328" y="4.445" size="1.27" layer="27" ratio="6" rot="SR0">&gt;Value</text>
</package>
</packages>
<packages3d>
<package3d name="CONN_SFH11-PBPC-D10-ST-BK_SUL" urn="urn:adsk.eagle:package:29732544/1" type="box" library_version="1">
<packageinstances>
<packageinstance name="CONN_SFH11-PBPC-D10-ST-BK_SUL"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="CONN_020P_000C_1" urn="urn:adsk.eagle:symbol:29732543/1" library_version="1">
<pin name="1" x="0" y="0" visible="pad" length="middle" direction="pas"/>
<pin name="2" x="0" y="-2.54" visible="pad" length="middle" direction="pas"/>
<pin name="3" x="0" y="-5.08" visible="pad" length="middle" direction="pas"/>
<pin name="4" x="0" y="-7.62" visible="pad" length="middle" direction="pas"/>
<pin name="5" x="0" y="-10.16" visible="pad" length="middle" direction="pas"/>
<pin name="6" x="0" y="-12.7" visible="pad" length="middle" direction="pas"/>
<pin name="7" x="0" y="-15.24" visible="pad" length="middle" direction="pas"/>
<pin name="8" x="0" y="-17.78" visible="pad" length="middle" direction="pas"/>
<pin name="9" x="0" y="-20.32" visible="pad" length="middle" direction="pas"/>
<pin name="10" x="0" y="-22.86" visible="pad" length="middle" direction="pas"/>
<pin name="11" x="0" y="-25.4" visible="pad" length="middle" direction="pas"/>
<pin name="12" x="0" y="-27.94" visible="pad" length="middle" direction="pas"/>
<pin name="13" x="0" y="-30.48" visible="pad" length="middle" direction="pas"/>
<pin name="14" x="0" y="-33.02" visible="pad" length="middle" direction="pas"/>
<pin name="15" x="0" y="-35.56" visible="pad" length="middle" direction="pas"/>
<pin name="16" x="0" y="-38.1" visible="pad" length="middle" direction="pas"/>
<pin name="17" x="0" y="-40.64" visible="pad" length="middle" direction="pas"/>
<pin name="18" x="0" y="-43.18" visible="pad" length="middle" direction="pas"/>
<pin name="19" x="0" y="-45.72" visible="pad" length="middle" direction="pas"/>
<pin name="20" x="0" y="-48.26" visible="pad" length="middle" direction="pas"/>
<wire x1="10.16" y1="0" x2="5.08" y2="0" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-2.54" x2="5.08" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-5.08" x2="5.08" y2="-5.08" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-7.62" x2="5.08" y2="-7.62" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-10.16" x2="5.08" y2="-10.16" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-12.7" x2="5.08" y2="-12.7" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-15.24" x2="5.08" y2="-15.24" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-17.78" x2="5.08" y2="-17.78" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-20.32" x2="5.08" y2="-20.32" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-22.86" x2="5.08" y2="-22.86" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-25.4" x2="5.08" y2="-25.4" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-27.94" x2="5.08" y2="-27.94" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-30.48" x2="5.08" y2="-30.48" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-33.02" x2="5.08" y2="-33.02" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-35.56" x2="5.08" y2="-35.56" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-38.1" x2="5.08" y2="-38.1" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-40.64" x2="5.08" y2="-40.64" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-43.18" x2="5.08" y2="-43.18" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-45.72" x2="5.08" y2="-45.72" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-48.26" x2="5.08" y2="-48.26" width="0.1524" layer="94"/>
<wire x1="10.16" y1="0" x2="8.89" y2="0.8382" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-2.54" x2="8.89" y2="-1.7018" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-5.08" x2="8.89" y2="-4.2418" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-7.62" x2="8.89" y2="-6.7818" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-10.16" x2="8.89" y2="-9.3218" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-12.7" x2="8.89" y2="-11.8618" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-15.24" x2="8.89" y2="-14.4018" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-17.78" x2="8.89" y2="-16.9418" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-20.32" x2="8.89" y2="-19.4818" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-22.86" x2="8.89" y2="-22.0218" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-25.4" x2="8.89" y2="-24.5618" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-27.94" x2="8.89" y2="-27.1018" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-30.48" x2="8.89" y2="-29.6418" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-33.02" x2="8.89" y2="-32.1818" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-35.56" x2="8.89" y2="-34.7218" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-38.1" x2="8.89" y2="-37.2618" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-40.64" x2="8.89" y2="-39.8018" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-43.18" x2="8.89" y2="-42.3418" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-45.72" x2="8.89" y2="-44.8818" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-48.26" x2="8.89" y2="-47.4218" width="0.1524" layer="94"/>
<wire x1="10.16" y1="0" x2="8.89" y2="-0.8382" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-2.54" x2="8.89" y2="-3.3782" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-5.08" x2="8.89" y2="-5.9182" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-7.62" x2="8.89" y2="-8.4582" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-10.16" x2="8.89" y2="-10.9982" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-12.7" x2="8.89" y2="-13.5382" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-15.24" x2="8.89" y2="-16.0782" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-17.78" x2="8.89" y2="-18.6182" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-20.32" x2="8.89" y2="-21.1582" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-22.86" x2="8.89" y2="-23.6982" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-25.4" x2="8.89" y2="-26.2382" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-27.94" x2="8.89" y2="-28.7782" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-30.48" x2="8.89" y2="-31.3182" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-33.02" x2="8.89" y2="-33.8582" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-35.56" x2="8.89" y2="-36.3982" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-38.1" x2="8.89" y2="-38.9382" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-40.64" x2="8.89" y2="-41.4782" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-43.18" x2="8.89" y2="-44.0182" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-45.72" x2="8.89" y2="-46.5582" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-48.26" x2="8.89" y2="-49.0982" width="0.1524" layer="94"/>
<wire x1="5.08" y1="2.54" x2="5.08" y2="-50.8" width="0.1524" layer="94"/>
<wire x1="5.08" y1="-50.8" x2="12.7" y2="-50.8" width="0.1524" layer="94"/>
<wire x1="12.7" y1="-50.8" x2="12.7" y2="2.54" width="0.1524" layer="94"/>
<wire x1="12.7" y1="2.54" x2="5.08" y2="2.54" width="0.1524" layer="94"/>
<text x="4.1656" y="5.3086" size="2.0828" layer="95" ratio="6" rot="SR0">&gt;Name</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="SFH11-PBPC-D10-ST-BK" urn="urn:adsk.eagle:component:29732545/1" prefix="J" library_version="1">
<gates>
<gate name="A" symbol="CONN_020P_000C_1" x="0" y="0"/>
</gates>
<devices>
<device name="" package="CONN_SFH11-PBPC-D10-ST-BK_SUL">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="10" pad="10"/>
<connect gate="A" pin="11" pad="11"/>
<connect gate="A" pin="12" pad="12"/>
<connect gate="A" pin="13" pad="13"/>
<connect gate="A" pin="14" pad="14"/>
<connect gate="A" pin="15" pad="15"/>
<connect gate="A" pin="16" pad="16"/>
<connect gate="A" pin="17" pad="17"/>
<connect gate="A" pin="18" pad="18"/>
<connect gate="A" pin="19" pad="19"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="20" pad="20"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
<connect gate="A" pin="7" pad="7"/>
<connect gate="A" pin="8" pad="8"/>
<connect gate="A" pin="9" pad="9"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:29732544/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="BUILT_BY" value="EMA_Cory" constant="no"/>
<attribute name="COPYRIGHT" value="Copyright (C) 2018 Accelerated Designs. All rights reserved" constant="no"/>
<attribute name="DATASHEET" value="https://s3.amazonaws.com/catalogspreads-pdf/PAGE123%20.100%20SFH11%20SERIES%20FEMALE%20HDR%20ST%20RA.pdf" constant="no"/>
<attribute name="MANUFACTURER_PART_NUMBER" value="SFH11-PBPC-D10-ST-BK" constant="no"/>
<attribute name="SOURCELIBRARY" value="Update_to_database_2021-05-10" constant="no"/>
<attribute name="VENDOR" value="Sullins" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="frames" urn="urn:adsk.eagle:library:229">
<description>&lt;b&gt;Frames for Sheet and Layout&lt;/b&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="A4L-LOC" urn="urn:adsk.eagle:symbol:13874/1" library_version="1">
<wire x1="256.54" y1="3.81" x2="256.54" y2="8.89" width="0.1016" layer="94"/>
<wire x1="256.54" y1="8.89" x2="256.54" y2="13.97" width="0.1016" layer="94"/>
<wire x1="256.54" y1="13.97" x2="256.54" y2="19.05" width="0.1016" layer="94"/>
<wire x1="256.54" y1="19.05" x2="256.54" y2="24.13" width="0.1016" layer="94"/>
<wire x1="161.29" y1="3.81" x2="161.29" y2="24.13" width="0.1016" layer="94"/>
<wire x1="161.29" y1="24.13" x2="215.265" y2="24.13" width="0.1016" layer="94"/>
<wire x1="215.265" y1="24.13" x2="256.54" y2="24.13" width="0.1016" layer="94"/>
<wire x1="246.38" y1="3.81" x2="246.38" y2="8.89" width="0.1016" layer="94"/>
<wire x1="246.38" y1="8.89" x2="256.54" y2="8.89" width="0.1016" layer="94"/>
<wire x1="246.38" y1="8.89" x2="215.265" y2="8.89" width="0.1016" layer="94"/>
<wire x1="215.265" y1="8.89" x2="215.265" y2="3.81" width="0.1016" layer="94"/>
<wire x1="215.265" y1="8.89" x2="215.265" y2="13.97" width="0.1016" layer="94"/>
<wire x1="215.265" y1="13.97" x2="256.54" y2="13.97" width="0.1016" layer="94"/>
<wire x1="215.265" y1="13.97" x2="215.265" y2="19.05" width="0.1016" layer="94"/>
<wire x1="215.265" y1="19.05" x2="256.54" y2="19.05" width="0.1016" layer="94"/>
<wire x1="215.265" y1="19.05" x2="215.265" y2="24.13" width="0.1016" layer="94"/>
<text x="217.17" y="15.24" size="2.54" layer="94">&gt;DRAWING_NAME</text>
<text x="217.17" y="10.16" size="2.286" layer="94">&gt;LAST_DATE_TIME</text>
<text x="230.505" y="5.08" size="2.54" layer="94">&gt;SHEET</text>
<text x="216.916" y="4.953" size="2.54" layer="94">Sheet:</text>
<frame x1="0" y1="0" x2="260.35" y2="179.07" columns="6" rows="4" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="A4L-LOC" urn="urn:adsk.eagle:component:13926/1" prefix="FRAME" uservalue="yes" library_version="1">
<description>&lt;b&gt;FRAME&lt;/b&gt;&lt;p&gt;
DIN A4, landscape with location and doc. field</description>
<gates>
<gate name="G$1" symbol="A4L-LOC" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="J1" library="STM32_SFH11-PBPC-D10-ST-BK_" library_urn="urn:adsk.eagle:library:29732539" deviceset="SFH11-PBPC-D10-ST-BK" device="" package3d_urn="urn:adsk.eagle:package:29732544/1"/>
<part name="GND2" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="GND1" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="FRAME1" library="frames" library_urn="urn:adsk.eagle:library:229" deviceset="A4L-LOC" device=""/>
<part name="PROG1" library="0532610671" library_urn="urn:adsk.eagle:library:29729274" deviceset="0532610671_OP" device="" package3d_urn="urn:adsk.eagle:package:29729278/2"/>
</parts>
<sheets>
<sheet>
<plain>
<text x="251.46" y="15.24" size="1.778" layer="94">MJM</text>
</plain>
<instances>
<instance part="J1" gate="A" x="86.36" y="139.7" smashed="yes">
<attribute name="NAME" x="90.5256" y="145.0086" size="2.0828" layer="95" ratio="6" rot="SR0"/>
</instance>
<instance part="GND2" gate="1" x="73.66" y="86.36" smashed="yes">
<attribute name="VALUE" x="71.12" y="83.82" size="1.778" layer="96"/>
</instance>
<instance part="GND1" gate="1" x="66.04" y="48.26" smashed="yes">
<attribute name="VALUE" x="63.5" y="45.72" size="1.778" layer="96"/>
</instance>
<instance part="FRAME1" gate="G$1" x="0" y="0" smashed="yes">
<attribute name="DRAWING_NAME" x="217.17" y="15.24" size="2.54" layer="94"/>
<attribute name="LAST_DATE_TIME" x="217.17" y="10.16" size="2.286" layer="94"/>
<attribute name="SHEET" x="230.505" y="5.08" size="2.54" layer="94"/>
</instance>
<instance part="PROG1" gate="G$1" x="86.36" y="63.5" smashed="yes">
<attribute name="NAME" x="86.36" y="73.66" size="1.778" layer="95"/>
<attribute name="VALUE" x="81.28" y="73.66" size="1.778" layer="96"/>
</instance>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<pinref part="J1" gate="A" pin="17"/>
<wire x1="86.36" y1="99.06" x2="73.66" y2="99.06" width="0.1524" layer="91"/>
<pinref part="GND2" gate="1" pin="GND"/>
<wire x1="73.66" y1="99.06" x2="73.66" y2="88.9" width="0.1524" layer="91"/>
<pinref part="J1" gate="A" pin="15"/>
<wire x1="86.36" y1="104.14" x2="73.66" y2="104.14" width="0.1524" layer="91"/>
<wire x1="73.66" y1="104.14" x2="73.66" y2="99.06" width="0.1524" layer="91"/>
<junction x="73.66" y="99.06"/>
<pinref part="J1" gate="A" pin="13"/>
<wire x1="86.36" y1="109.22" x2="73.66" y2="109.22" width="0.1524" layer="91"/>
<wire x1="73.66" y1="109.22" x2="73.66" y2="104.14" width="0.1524" layer="91"/>
<junction x="73.66" y="104.14"/>
<pinref part="J1" gate="A" pin="11"/>
<wire x1="86.36" y1="114.3" x2="73.66" y2="114.3" width="0.1524" layer="91"/>
<wire x1="73.66" y1="114.3" x2="73.66" y2="109.22" width="0.1524" layer="91"/>
<junction x="73.66" y="109.22"/>
<pinref part="J1" gate="A" pin="9"/>
<wire x1="86.36" y1="119.38" x2="73.66" y2="119.38" width="0.1524" layer="91"/>
<wire x1="73.66" y1="119.38" x2="73.66" y2="114.3" width="0.1524" layer="91"/>
<junction x="73.66" y="114.3"/>
<pinref part="J1" gate="A" pin="7"/>
<wire x1="86.36" y1="124.46" x2="73.66" y2="124.46" width="0.1524" layer="91"/>
<wire x1="73.66" y1="124.46" x2="73.66" y2="119.38" width="0.1524" layer="91"/>
<junction x="73.66" y="119.38"/>
<pinref part="J1" gate="A" pin="5"/>
<wire x1="86.36" y1="129.54" x2="73.66" y2="129.54" width="0.1524" layer="91"/>
<wire x1="73.66" y1="129.54" x2="73.66" y2="124.46" width="0.1524" layer="91"/>
<junction x="73.66" y="124.46"/>
<pinref part="J1" gate="A" pin="3"/>
<wire x1="86.36" y1="134.62" x2="73.66" y2="134.62" width="0.1524" layer="91"/>
<wire x1="73.66" y1="134.62" x2="73.66" y2="129.54" width="0.1524" layer="91"/>
<junction x="73.66" y="129.54"/>
<pinref part="J1" gate="A" pin="1"/>
<wire x1="86.36" y1="139.7" x2="73.66" y2="139.7" width="0.1524" layer="91"/>
<wire x1="73.66" y1="139.7" x2="73.66" y2="134.62" width="0.1524" layer="91"/>
<junction x="73.66" y="134.62"/>
</segment>
<segment>
<pinref part="GND1" gate="1" pin="GND"/>
<wire x1="66.04" y1="60.96" x2="66.04" y2="50.8" width="0.1524" layer="91"/>
<pinref part="PROG1" gate="G$1" pin="GND"/>
<wire x1="66.04" y1="60.96" x2="81.28" y2="60.96" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SWDIO" class="0">
<segment>
<pinref part="J1" gate="A" pin="14"/>
<wire x1="86.36" y1="106.68" x2="68.58" y2="106.68" width="0.1524" layer="91"/>
<label x="68.58" y="106.68" size="1.27" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<label x="76.2" y="66.04" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="PROG1" gate="G$1" pin="SWDIO"/>
<wire x1="76.2" y1="66.04" x2="81.28" y2="66.04" width="0.1524" layer="91"/>
</segment>
</net>
<net name="!RESET" class="0">
<segment>
<pinref part="J1" gate="A" pin="6"/>
<wire x1="86.36" y1="127" x2="68.58" y2="127" width="0.1524" layer="91"/>
<label x="68.58" y="127" size="1.27" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<label x="76.2" y="63.5" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="PROG1" gate="G$1" pin="!RST"/>
<wire x1="76.2" y1="63.5" x2="81.28" y2="63.5" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SWO" class="0">
<segment>
<pinref part="J1" gate="A" pin="8"/>
<wire x1="86.36" y1="121.92" x2="68.58" y2="121.92" width="0.1524" layer="91"/>
<label x="68.58" y="121.92" size="1.27" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="SWCLK" class="0">
<segment>
<pinref part="J1" gate="A" pin="12"/>
<wire x1="86.36" y1="111.76" x2="68.58" y2="111.76" width="0.1524" layer="91"/>
<label x="68.58" y="111.76" size="1.27" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<label x="76.2" y="68.58" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="PROG1" gate="G$1" pin="SWCLK"/>
<wire x1="76.2" y1="68.58" x2="81.28" y2="68.58" width="0.1524" layer="91"/>
</segment>
</net>
<net name="VREF" class="0">
<segment>
<pinref part="PROG1" gate="G$1" pin="VREF"/>
<wire x1="81.28" y1="55.88" x2="76.2" y2="55.88" width="0.1524" layer="91"/>
<label x="76.2" y="55.88" size="1.27" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="J1" gate="A" pin="19"/>
<wire x1="86.36" y1="93.98" x2="78.74" y2="93.98" width="0.1524" layer="91"/>
<pinref part="J1" gate="A" pin="20"/>
<wire x1="86.36" y1="91.44" x2="78.74" y2="91.44" width="0.1524" layer="91"/>
<wire x1="78.74" y1="91.44" x2="78.74" y2="93.98" width="0.1524" layer="91"/>
<wire x1="78.74" y1="93.98" x2="68.58" y2="93.98" width="0.1524" layer="91"/>
<junction x="78.74" y="93.98"/>
<label x="68.58" y="93.98" size="1.27" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="8.2" severity="warning">
Since Version 8.2, EAGLE supports online libraries. The ids
of those online libraries will not be understood (or retained)
with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports URNs for individual library
assets (packages, symbols, and devices). The URNs of those assets
will not be understood (or retained) with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports the association of 3D packages
with devices in libraries, schematics, and board files. Those 3D
packages will not be understood (or retained) with this version.
</note>
</compatibility>
</eagle>
