<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:variable name='logout'>Abmelden</xsl:variable>
<xsl:variable name='about'>Info</xsl:variable>
<xsl:variable name='msgInvalidData'>Es wurden ung&#x00fc;ltige Daten eingegeben.</xsl:variable>
<xsl:variable name='msgInvalidData.ipv4'>Eine g&#x00fc;ltige IPv4-Adresse besteht aus vier Zahlen (0-255), die durch Punkte zu trennen sind, zum Beispiel: '123.0.255.3'.</xsl:variable>
<xsl:variable name='msgInvalidData.netmask'>Eine g&#x00fc;ltige Netzmaske besteht aus vier Zahlen (0-255), die durch Punkte zu trennen sind, zum Beispiel '123.0.255.3'.</xsl:variable>
<xsl:variable name='msgInvalidData.mac'>Eine g&#x00fc;ltige MAC-Adresse besitzt das Format 'nn:nn:nn:nn:nn:nn', wobei 'n' entweder eine Zahl (0-9) oder ein Buchstabe sein kann (A-F).</xsl:variable>
<xsl:variable name='msgInvalidData.ipv6'>Eine g&#x00fc;ltige IPv6-Adresse ist n:n:n:n:n:n:n:n, wobei die &#92;&#34;n&#92;&#34;s f&#x00fc;r Ziffern (0&#x2013;9) bzw. Buchstaben (A&#x2013;F) stehen</xsl:variable>
<xsl:variable name='msgInvalidData.ipv6mask'>Es wurden ung&#x00fc;ltige Daten eingegeben</xsl:variable>
<xsl:variable name='msgInvalidData.time2'>Die eingegebene Zeitangabe muss zwischen 1:00 und 12:59 liegen.</xsl:variable>
<xsl:variable name='msgInvalidData.miltime2'>Die eingegebene Zeitangabe muss zwischen 0:00 und 23:59 liegen.</xsl:variable>
<xsl:variable name='msgNoncontiguousReorder'>Sie k&#x00f6;nnen nur aneinander angrenzende Zeilen neu ordnen.</xsl:variable>
<xsl:variable name='msgStepHasErrors'>Assistenten-Schritt enth&#x00e4;lt einen oder mehr Fehler.</xsl:variable>
<xsl:variable name='msgTabHasErrors'>Registerkarte enth&#x00e4;lt einen oder mehr Fehler.</xsl:variable>
<xsl:variable name='rowsperpage'>Zeilen pro Seite</xsl:variable>
<xsl:variable name='perpage'>pro Seite</xsl:variable>
<xsl:variable name='itemsperpage'>Elemente pro Seite</xsl:variable>
<xsl:variable name='page'>Seite</xsl:variable>
<xsl:variable name='of'>von</xsl:variable>
<xsl:variable name='go'>Start</xsl:variable>
<xsl:variable name='setall'>Alle ausw&#x00e4;hlen</xsl:variable>
<xsl:variable name='clearall'>Alle l&#x00f6;schen</xsl:variable>
<xsl:variable name='undoall'>Alle r&#x00fc;ckg&#x00e4;ngig</xsl:variable>
<xsl:variable name='sun'>So</xsl:variable>
<xsl:variable name='mon'>Mo</xsl:variable>
<xsl:variable name='tue'>Di</xsl:variable>
<xsl:variable name='wed'>Mi</xsl:variable>
<xsl:variable name='thu'>Do</xsl:variable>
<xsl:variable name='fri'>Fr</xsl:variable>
<xsl:variable name='sat'>Sa</xsl:variable>
<xsl:variable name='login'>Anmelden</xsl:variable>
<xsl:variable name='submit'>Senden</xsl:variable>
<xsl:variable name='reset'>Zur&#x00fc;cksetzen</xsl:variable>
<xsl:variable name='filter'>Filter</xsl:variable>
<xsl:variable name='matchif'>Zuordnen, falls</xsl:variable>
<xsl:variable name='matchgo'>Start</xsl:variable>
<xsl:variable name='matchclear'>Filter leeren</xsl:variable>
<xsl:variable name='matchcontains'>Enth&#x00e4;lt</xsl:variable>
<xsl:variable name='matchnotcontain'>Enth&#x00e4;lt nicht</xsl:variable>
<xsl:variable name='matchstartswith'>Beginnt mit</xsl:variable>
<xsl:variable name='matchendswith'>Endet mit</xsl:variable>
<xsl:variable name='matchexactly'>Ist gleich</xsl:variable>
<xsl:variable name='matchnotexactly'>Nicht</xsl:variable>
<xsl:variable name='matchempty'>Leer</xsl:variable>
<xsl:variable name='matchnotempty'>Ist nicht leer</xsl:variable>
<xsl:variable name='matchistrue'>Richtig</xsl:variable>
<xsl:variable name='matchisfalse'>Falsch</xsl:variable>
<xsl:variable name='matchgreater'>Gr&#x00f6;&#x00df;er als</xsl:variable>
<xsl:variable name='matchgreaterequal'>Gr&#x00f6;&#x00df;er als oder gleich</xsl:variable>
<xsl:variable name='matchless'>Kleiner als</xsl:variable>
<xsl:variable name='matchlessequal'>Kleiner als oder gleich</xsl:variable>
<xsl:variable name='matchequal'>Gleich</xsl:variable>
<xsl:variable name='matchnotequal'>Nicht gleich</xsl:variable>
<xsl:variable name='matchafter'>Nach</xsl:variable>
<xsl:variable name='matchafterequal'>Nach oder gleich</xsl:variable>
<xsl:variable name='matchbefore'>Vor</xsl:variable>
<xsl:variable name='matchbeforeequal'>Vor oder gleich</xsl:variable>
<xsl:variable name='sortclue'>Zum Sortieren klicken</xsl:variable>
<xsl:variable name='special'>Besonders</xsl:variable>
<xsl:variable name='blocked'>Blockierter Tag</xsl:variable>
<xsl:variable name='today'>Heute</xsl:variable>
<xsl:variable name='jan'>Jan</xsl:variable>
<xsl:variable name='feb'>Feb</xsl:variable>
<xsl:variable name='mar'>M&#x00e4;r</xsl:variable>
<xsl:variable name='apr'>Apr</xsl:variable>
<xsl:variable name='may'>Mai</xsl:variable>
<xsl:variable name='jun'>Jun</xsl:variable>
<xsl:variable name='jul'>Jul</xsl:variable>
<xsl:variable name='aug'>Aug</xsl:variable>
<xsl:variable name='sep'>Sep</xsl:variable>
<xsl:variable name='oct'>Okt</xsl:variable>
<xsl:variable name='nov'>Nov</xsl:variable>
<xsl:variable name='dec'>Dez</xsl:variable>
<xsl:variable name='navigation'>Navigation</xsl:variable>
<xsl:variable name='items'>Elemente</xsl:variable>
<xsl:variable name='showing'>Anzeige</xsl:variable>
<xsl:variable name='back'>Zur&#x00fc;ck</xsl:variable>
<xsl:variable name='next'>Weiter</xsl:variable>
<xsl:variable name='previous'>Zur&#x00fc;ck</xsl:variable>
<xsl:variable name='help'>Hilfe</xsl:variable>
<xsl:variable name='cancel'>Abbruch</xsl:variable>
<xsl:variable name='ok'>OK</xsl:variable>
<xsl:variable name='movetotop'>Schaltfl&#x00e4;che &#92;&#34;Nach oben verschieben&#92;&#34;: Verschiebt den aktuell ausgew&#x00e4;hlten Artikel an den Anfang der ausgew&#x00e4;hlten Liste</xsl:variable>
<xsl:variable name='movetobottom'>Schaltfl&#x00e4;che &#92;&#34;Nach unten verschieben&#92;&#34;: Verschiebt den aktuell ausgew&#x00e4;hlten Artikel an das Ende der ausgew&#x00e4;hlten Liste</xsl:variable>
<xsl:variable name='moveup'>Schaltfl&#x00e4;che &#92;&#34;Nach oben&#92;&#34;: Verschiebt den aktuell ausgew&#x00e4;hlten Artikel in der ausgew&#x00e4;hlten Liste um eine Position nach oben</xsl:variable>
<xsl:variable name='movedown'>Schaltfl&#x00e4;che &#92;&#34;Nach unten&#92;&#34;: Verschiebt den aktuell ausgew&#x00e4;hlten Artikel in der ausgew&#x00e4;hlten Liste um eine Position nach unten</xsl:variable>
<xsl:variable name='moveright'>Schaltfl&#x00e4;che &#92;&#34;Ausw&#x00e4;hlen&#92;&#34;: &#x00dc;bertr&#x00e4;gt den aktuell ausgew&#x00e4;hlten Artikel aus dem Auswahlfeld &#92;&#34;Verf&#x00fc;gbar&#92;&#34; in das Auswahlfeld &#92;&#34;Ausgew&#x00e4;hlt&#92;&#34;</xsl:variable>
<xsl:variable name='moveallright'>Schaltfl&#x00e4;che &#92;&#34;Alle ausw&#x00e4;hlen&#92;&#34;: W&#x00e4;hlt alle Artikel im Auswahlfeld &#92;&#34;Verf&#x00fc;gbar&#92;&#34; aus</xsl:variable>
<xsl:variable name='moveleft'>Schaltfl&#x00e4;che &#92;&#34;Auswahl aufheben&#92;&#34;: Entfernt den aktuell ausgew&#x00e4;hlten Artikel aus dem Auswahlfeld &#92;&#34;Ausgew&#x00e4;hlt&#92;&#34;</xsl:variable>
<xsl:variable name='moveallleft'>Schaltfl&#x00e4;che &#92;&#34;Auswahl f&#x00fc;r alle aufheben&#92;&#34;: Entfernt alle Artikel aus dem Auswahlfeld &#92;&#34;Ausgew&#x00e4;hlt&#92;&#34;</xsl:variable>
<xsl:variable name='showchoices'>Auswahl anzeigen</xsl:variable>
<xsl:variable name='sortascending'>Aufsteigend sortieren</xsl:variable>
<xsl:variable name='sortdescending'>Absteigend sortieren</xsl:variable>
<xsl:variable name='scrollup'>Aufw&#x00e4;rts bl&#x00e4;ttern</xsl:variable>
<xsl:variable name='scrolldown'>Abw&#x00e4;rts bl&#x00e4;ttern</xsl:variable>
<xsl:variable name='expanddrawer'>Maximieren</xsl:variable>
<xsl:variable name='collapsedrawer'>Minimieren</xsl:variable>
<xsl:variable name='collapsenav'>Navigationsfenster minimieren</xsl:variable>
<xsl:variable name='expandnav'>Navigationsfenster maximieren</xsl:variable>
<xsl:variable name='resizenav'>Navigationsfenster wiederherstellen</xsl:variable>
<xsl:variable name='resizetaskpane'>Taskleiste vergr&#x00f6;&#x00df;ern/verkleinern</xsl:variable>
<xsl:variable name='spinner'>Verringert/Erh&#x00f6;ht verwandten Wert</xsl:variable>
<xsl:variable name='firstpage'>Erste Seite</xsl:variable>
<xsl:variable name='previouspage'>Vorherige Seite</xsl:variable>
<xsl:variable name='nextpage'>N&#x00e4;chste Seite</xsl:variable>
<xsl:variable name='lastpage'>Letzte Seite</xsl:variable>
<xsl:variable name='singlerowselection'>Auswahl einer Reihe</xsl:variable>
<xsl:variable name='multiplerowselection'>Auswahl mehrerer Reihen</xsl:variable>
<xsl:variable name='allrowselection'>Alle Zeilen ausw&#x00e4;hlen</xsl:variable>
<xsl:variable name='increaseindentation'>Einr&#x00fc;ckung erweitern</xsl:variable>
<xsl:variable name='decreaseindentation'>Einr&#x00fc;ckung verringern</xsl:variable>
<xsl:variable name='leaf'>Folie</xsl:variable>
<xsl:variable name='expandtree'>Baumelement maximieren</xsl:variable>
<xsl:variable name='collapsetree'>Baumelement minimieren</xsl:variable>
<xsl:variable name='togglepane'>Fensterstatus &#x00e4;ndern</xsl:variable>
<xsl:variable name='closepane'>Fenster schlie&#x00df;en</xsl:variable>
<xsl:variable name='msgRequiredField'>Erforderliches Feld</xsl:variable>
<xsl:variable name='msgRequiredFieldsNotice'>Erforderliche Felder</xsl:variable>
<xsl:variable name='moveto_move'>Verschieben</xsl:variable>
<xsl:variable name='moveto_above'>&#x00dc;ber</xsl:variable>
<xsl:variable name='moveto_below'>Unter</xsl:variable>
<xsl:variable name='moveto_rownum'>Zeilennummer</xsl:variable>
<xsl:variable name='moveto_moveto'>Verschieben nach</xsl:variable>
<xsl:variable name='applynew'>Anwenden</xsl:variable>
<xsl:variable name='emptyrow'>Keine anzuzeigenden Daten vorhanden</xsl:variable>
<xsl:variable name='more'>Mehr</xsl:variable>
<xsl:variable name='less'>Weniger</xsl:variable>
<xsl:variable name='loading'>Laden</xsl:variable>
<xsl:variable name='moveabsolute'>Auswahl an angegebenen Speicherort verschieben</xsl:variable>
<xsl:variable name='showdatepicker'>Kalender anzeigen</xsl:variable>
<xsl:variable name='showpreviousmonth'>Vorherigen Monat anzeigen</xsl:variable>
<xsl:variable name='shownextmonth'>N&#x00e4;chsten Monat anzeigen</xsl:variable>
<xsl:variable name='msgVerifyingLogin'>&#x00dc;berpr&#x00fc;fen</xsl:variable>
<xsl:variable name='all'>Alle</xsl:variable>
<xsl:variable name='msgReorderError'>Die angegebene Zeilennummer existiert nicht</xsl:variable>
<xsl:variable name='currentpasswordprompt'>Aktuelles Kennwort eingeben</xsl:variable>
<xsl:variable name='newpasswordprompt'>Neues Kennwort eingeben</xsl:variable>
<xsl:variable name='confirmpasswordprompt'>Kennwort erneut eingeben</xsl:variable>
<xsl:variable name='save'>Speichern</xsl:variable>
<xsl:variable name='newwindow'>In neuem Fenster &#x00f6;ffnen</xsl:variable>
<xsl:variable name='gettingstarted'>Erste Schritte</xsl:variable>
<xsl:variable name='donotshowagain'>Nicht wieder anzeigen</xsl:variable>
<xsl:variable name='companylogo'>Cisco Logo</xsl:variable>
<xsl:variable name='results'>Ergebnisse</xsl:variable>
<xsl:variable name='editthismodule'>Dieses Modul bearbeiten</xsl:variable>
<xsl:variable name='remove'>Entfernen</xsl:variable>
<xsl:variable name='loginproblem'>Probleme bei der Anmeldung?</xsl:variable>
<xsl:variable name='expandpane'>Maximieren</xsl:variable>
<xsl:variable name='collapsepane'>Minimieren</xsl:variable>
<xsl:variable name='restorepane'>Wiederherstellen</xsl:variable>
<xsl:variable name='dateselectionmonth'>Datumsauswahl &#92;&#34;Monat&#92;&#34;</xsl:variable>
<xsl:variable name='dateselectionday'>Datumsauswahl &#92;&#34;Tag&#92;&#34;</xsl:variable>
<xsl:variable name='dateselectionyear'>Datumsauswahl &#92;&#34;Jahr&#92;&#34;</xsl:variable>
<xsl:variable name='timeselectionhour'>Zeitauswahl &#92;&#34;Stunde&#92;&#34;</xsl:variable>
<xsl:variable name='timeselectionminute'>Zeitauswahl &#92;&#34;Minute&#92;&#34;</xsl:variable>
<xsl:variable name='timeselectionampm'>Zeitauswahl &#92;&#34;AM (vor Mittag)&#92;&#34; oder &#92;&#34;PM (nach Mittag)&#92;&#34;</xsl:variable>
<xsl:variable name='and'>und</xsl:variable>
<xsl:variable name='or'>oder</xsl:variable>
<xsl:variable name='addfilter'>Filter hinzuf&#x00fc;gen</xsl:variable>
<xsl:variable name='removefilter'>Filter entfernen</xsl:variable>
<xsl:variable name='filterrelationship'>Beziehung filtern</xsl:variable>
<xsl:variable name='signin'>Anmelden</xsl:variable>
<xsl:variable name='signout'>Abmelden</xsl:variable>
<xsl:variable name='submenu'>Untermen&#x00fc;</xsl:variable>
<xsl:variable name='gotopage1'>Gehe zu Seite 1</xsl:variable>
<xsl:variable name='gotopage2'>Gehe zu Seite 2</xsl:variable>
<xsl:variable name='gotopage3'>Gehe zu Seite 3</xsl:variable>
<xsl:variable name='gotopage4'>Gehe zu Seite 4</xsl:variable>
<xsl:variable name='gotopage5'>Gehe zu Seite 5</xsl:variable>
<xsl:variable name='gotopage6'>Gehe zu Seite 6</xsl:variable>
<xsl:variable name='gotopage7'>Gehe zu Seite 7</xsl:variable>
<xsl:variable name='gotopage8'>Gehe zu Seite 8</xsl:variable>
<xsl:variable name='gotopage9'>Gehe zu Seite 9</xsl:variable>
<xsl:variable name='gotopage10'>Gehe zu Seite 10</xsl:variable>
<xsl:variable name='refresh'>Aktualisieren</xsl:variable>
<xsl:variable name='status'>Status</xsl:variable>
<xsl:variable name='togglefilters'>Filteransicht wechseln</xsl:variable>
<xsl:variable name='itemsselected'>Ausgew&#x00e4;hlte Artikel</xsl:variable>
<xsl:variable name='bulkvisible'>Alle xxx sichtbaren Zeilen sind ausgew&#x00e4;hlt.</xsl:variable>
<xsl:variable name='bulktotal'>Alle xxx Zeilen ausw&#x00e4;hlen</xsl:variable>
<xsl:variable name='informationalmessage'>Informationsmeldungen</xsl:variable>
<xsl:variable name='criticalerrormessage'>Meldung &#92;&#34;Kritischer Fehler&#92;&#34;</xsl:variable>
<xsl:variable name='errormessage'>Fehlermeldung</xsl:variable>
<xsl:variable name='warningmessage'>Warnungsmeldung</xsl:variable>
<xsl:variable name='successmessage'>Erfolgsmeldung</xsl:variable>
<xsl:variable name='alert'>Warnung</xsl:variable>
<xsl:variable name='confirm'>Best&#x00e4;tigen</xsl:variable>
<xsl:variable name='prompt'>Eingabeaufforderung</xsl:variable>
<xsl:variable name='yes'>Ja</xsl:variable>
<xsl:variable name='no'>Nein</xsl:variable>
<xsl:variable name='expandwindow'>Maximieren Sie das Fenster, um weitere Elemente zu sehen</xsl:variable>
<xsl:variable name='messagenumber'>Meldungsnummer</xsl:variable>
<xsl:variable name='rssfeed'>RSS Feed</xsl:variable>
</xsl:stylesheet>
