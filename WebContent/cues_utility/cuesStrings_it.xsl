<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:variable name='logout'>Esci</xsl:variable>
<xsl:variable name='about'>Informazioni su</xsl:variable>
<xsl:variable name='msgInvalidData'>Sono stati immessi dati non validi</xsl:variable>
<xsl:variable name='msgInvalidData.ipv4'>Per essere valido, un indirizzo IPv4 deve essere costituito da quattro numeri (da 0 a 255), separati da punti, ad esempio 123.0.255.3</xsl:variable>
<xsl:variable name='msgInvalidData.netmask'>Per essere valida, una maschera deve essere costituita da quattro numeri (da 0 a 255), separati da punti, ad esempio 123.0.255.3</xsl:variable>
<xsl:variable name='msgInvalidData.mac'>Un indirizzo MAC valido ha il seguente formato: nn:nn:nn:nn:nn:nn, in cui ciascuna &#92;&#34;n&#92;&#34; rappresenta un numero (0-9) o una lettera (A-F)</xsl:variable>
<xsl:variable name='msgInvalidData.ipv6'>Un indirizzo IPv6 valido ha il seguente formato n:n:n:n:n:n:n:n, in cui ciascuna 'n' rappresenta un numero (0-9) o una lettera (A-F)</xsl:variable>
<xsl:variable name='msgInvalidData.ipv6mask'>Sono stati immessi dati non validi</xsl:variable>
<xsl:variable name='msgInvalidData.time2'>L'orario immesso deve essere compreso nell'intervallo 1.00-12.59</xsl:variable>
<xsl:variable name='msgInvalidData.miltime2'>L'orario immesso deve essere compreso nell'intervallo 0.00-23.59</xsl:variable>
<xsl:variable name='msgNoncontiguousReorder'>&#x00c8; possibile riordinare solo le righe selezionate contigue</xsl:variable>
<xsl:variable name='msgStepHasErrors'>Il passo della procedura guidata contiene uno o pi&#x00f9; errori</xsl:variable>
<xsl:variable name='msgTabHasErrors'>La scheda contiene 1 o pi&#x00f9; errori</xsl:variable>
<xsl:variable name='rowsperpage'>Righe per pagina</xsl:variable>
<xsl:variable name='perpage'>per pagina</xsl:variable>
<xsl:variable name='itemsperpage'>Elementi per pagina</xsl:variable>
<xsl:variable name='page'>Pagina</xsl:variable>
<xsl:variable name='of'>di</xsl:variable>
<xsl:variable name='go'>Vai</xsl:variable>
<xsl:variable name='setall'>Seleziona tutto</xsl:variable>
<xsl:variable name='clearall'>Cancella tutto</xsl:variable>
<xsl:variable name='undoall'>Annulla tutto</xsl:variable>
<xsl:variable name='sun'>Dom</xsl:variable>
<xsl:variable name='mon'>Lun</xsl:variable>
<xsl:variable name='tue'>Mar</xsl:variable>
<xsl:variable name='wed'>Mer</xsl:variable>
<xsl:variable name='thu'>Gio</xsl:variable>
<xsl:variable name='fri'>Ven</xsl:variable>
<xsl:variable name='sat'>Sab</xsl:variable>
<xsl:variable name='login'>Accedi</xsl:variable>
<xsl:variable name='submit'>Invia</xsl:variable>
<xsl:variable name='reset'>Reimposta</xsl:variable>
<xsl:variable name='filter'>Filtro</xsl:variable>
<xsl:variable name='matchif'>Corrisponde se</xsl:variable>
<xsl:variable name='matchgo'>Vai</xsl:variable>
<xsl:variable name='matchclear'>Cancella filtro</xsl:variable>
<xsl:variable name='matchcontains'>Contiene</xsl:variable>
<xsl:variable name='matchnotcontain'>Non contiene</xsl:variable>
<xsl:variable name='matchstartswith'>Inizia con</xsl:variable>
<xsl:variable name='matchendswith'>Termina con</xsl:variable>
<xsl:variable name='matchexactly'>&#x00c8; uguale a</xsl:variable>
<xsl:variable name='matchnotexactly'>Non &#x00e8;</xsl:variable>
<xsl:variable name='matchempty'>&#x00c8; vuoto</xsl:variable>
<xsl:variable name='matchnotempty'>Non &#x00e8; vuoto</xsl:variable>
<xsl:variable name='matchistrue'>&#x00c8; vero</xsl:variable>
<xsl:variable name='matchisfalse'>&#x00c8; falso</xsl:variable>
<xsl:variable name='matchgreater'>&#x00c8; maggiore di</xsl:variable>
<xsl:variable name='matchgreaterequal'>&#x00c8; maggiore di o uguale a</xsl:variable>
<xsl:variable name='matchless'>&#x00c8; minore di</xsl:variable>
<xsl:variable name='matchlessequal'>&#x00c8; minore di o uguale a</xsl:variable>
<xsl:variable name='matchequal'>&#x00c8; uguale a</xsl:variable>
<xsl:variable name='matchnotequal'>Non &#x00e8; uguale a</xsl:variable>
<xsl:variable name='matchafter'>&#x00c8; successivo</xsl:variable>
<xsl:variable name='matchafterequal'>&#x00c8; successivo o uguale a</xsl:variable>
<xsl:variable name='matchbefore'>&#x00c8; precedente</xsl:variable>
<xsl:variable name='matchbeforeequal'>&#x00c8; precedente o uguale a</xsl:variable>
<xsl:variable name='sortclue'>Fare clic per ordinare</xsl:variable>
<xsl:variable name='special'>Speciale</xsl:variable>
<xsl:variable name='blocked'>Giorno bloccato</xsl:variable>
<xsl:variable name='today'>Oggi</xsl:variable>
<xsl:variable name='jan'>Gen</xsl:variable>
<xsl:variable name='feb'>Feb</xsl:variable>
<xsl:variable name='mar'>Mar</xsl:variable>
<xsl:variable name='apr'>Apr</xsl:variable>
<xsl:variable name='may'>Mag</xsl:variable>
<xsl:variable name='jun'>Giu</xsl:variable>
<xsl:variable name='jul'>Lug</xsl:variable>
<xsl:variable name='aug'>Ago</xsl:variable>
<xsl:variable name='sep'>Set</xsl:variable>
<xsl:variable name='oct'>Ott</xsl:variable>
<xsl:variable name='nov'>Nov</xsl:variable>
<xsl:variable name='dec'>Dic</xsl:variable>
<xsl:variable name='navigation'>Vai a</xsl:variable>
<xsl:variable name='items'>Elementi</xsl:variable>
<xsl:variable name='showing'>Mostrati</xsl:variable>
<xsl:variable name='back'>Indietro</xsl:variable>
<xsl:variable name='next'>Avanti</xsl:variable>
<xsl:variable name='previous'>Precedente</xsl:variable>
<xsl:variable name='help'>Guida</xsl:variable>
<xsl:variable name='cancel'>Annulla</xsl:variable>
<xsl:variable name='ok'>&#x00c8; stata rilevata una configurazione DMVPN esistente. &#x00c8; possibile modificare o eliminare la configurazione in modalit&#x00e0; avanzata. SDM supporta solo un tunnel DMVPN.</xsl:variable>
<xsl:variable name='movetotop'>Pulsante Sposta all'inizio - Sposta l'elemento scelto all'inizio dell'elenco selezionato</xsl:variable>
<xsl:variable name='movetobottom'>Pulsante Sposta alla fine - Sposta l'elemento scelto alla fine dell'elenco selezionato</xsl:variable>
<xsl:variable name='moveup'>Pulsante Sposta su - Sposta l'elemento scelto di una posizione verso l'alto nell'elenco selezionato</xsl:variable>
<xsl:variable name='movedown'>Pulsante Sposta gi&#x00f9; - Sposta l'elemento scelto di una posizione verso il basso nell'elenco selezionato</xsl:variable>
<xsl:variable name='moveright'>Pulsante Seleziona - Trasferisce l'elemento scelto dalla casella disponibile alla casella selezionata</xsl:variable>
<xsl:variable name='moveallright'>Pulsante Seleziona tutti - Seleziona tutti gli elementi nella casella disponibile</xsl:variable>
<xsl:variable name='moveleft'>Pulsante Deseleziona - Rimuove l'elemento scelto dalla casella selezionata</xsl:variable>
<xsl:variable name='moveallleft'>Pulsante Deseleziona tutti - Rimuove tutti gli elementi dalla casella selezionata</xsl:variable>
<xsl:variable name='showchoices'>Mostra elementi scelti</xsl:variable>
<xsl:variable name='sortascending'>Ordine crescente</xsl:variable>
<xsl:variable name='sortdescending'>Ordine decrescente</xsl:variable>
<xsl:variable name='scrollup'>Scorrimento verso l'alto</xsl:variable>
<xsl:variable name='scrolldown'>Scorrimento verso il basso</xsl:variable>
<xsl:variable name='expanddrawer'>Espandi</xsl:variable>
<xsl:variable name='collapsedrawer'>Comprimi</xsl:variable>
<xsl:variable name='collapsenav'>Comprimi riquadro di navigazione</xsl:variable>
<xsl:variable name='expandnav'>Espandi riquadro di navigazione</xsl:variable>
<xsl:variable name='resizenav'>Ridimensiona riquadro di navigazione</xsl:variable>
<xsl:variable name='resizetaskpane'>Ridimensiona riquadro attivit&#x00e0;</xsl:variable>
<xsl:variable name='spinner'>Aumenta/riduci valore associato</xsl:variable>
<xsl:variable name='firstpage'>Prima pagina</xsl:variable>
<xsl:variable name='previouspage'>Pagina precedente</xsl:variable>
<xsl:variable name='nextpage'>Pagina successiva</xsl:variable>
<xsl:variable name='lastpage'>Ultima pagina</xsl:variable>
<xsl:variable name='singlerowselection'>selezione righe singole</xsl:variable>
<xsl:variable name='multiplerowselection'>selezione righe multiple</xsl:variable>
<xsl:variable name='allrowselection'>Seleziona tutte le righe</xsl:variable>
<xsl:variable name='increaseindentation'>Aumenta rientro</xsl:variable>
<xsl:variable name='decreaseindentation'>Riduci rientro</xsl:variable>
<xsl:variable name='leaf'>Foglia</xsl:variable>
<xsl:variable name='expandtree'>Espandi elemento dell'albero</xsl:variable>
<xsl:variable name='collapsetree'>Comprimi elemento dell'albero</xsl:variable>
<xsl:variable name='togglepane'>Attiva/disattiva stato riquadro</xsl:variable>
<xsl:variable name='closepane'>Chiudi riquadro</xsl:variable>
<xsl:variable name='msgRequiredField'>Campo obbligatorio</xsl:variable>
<xsl:variable name='msgRequiredFieldsNotice'>Campi obbligatori</xsl:variable>
<xsl:variable name='moveto_move'>Sposta</xsl:variable>
<xsl:variable name='moveto_above'>Sopra</xsl:variable>
<xsl:variable name='moveto_below'>Sotto</xsl:variable>
<xsl:variable name='moveto_rownum'>Numero riga</xsl:variable>
<xsl:variable name='moveto_moveto'>Sposta in</xsl:variable>
<xsl:variable name='applynew'>Applica nuovo</xsl:variable>
<xsl:variable name='emptyrow'>Nessun dato da mostrare</xsl:variable>
<xsl:variable name='more'>pi&#x00f9;</xsl:variable>
<xsl:variable name='less'>meno</xsl:variable>
<xsl:variable name='loading'>Caricamento in corso....</xsl:variable>
<xsl:variable name='moveabsolute'>Sposta l'elemento selezionato verso una specifica posizione</xsl:variable>
<xsl:variable name='showdatepicker'>Mostra il selettore date</xsl:variable>
<xsl:variable name='showpreviousmonth'>Mostra il mese precedente</xsl:variable>
<xsl:variable name='shownextmonth'>Mostra il prossimo mese</xsl:variable>
<xsl:variable name='msgVerifyingLogin'>Verifica in corso</xsl:variable>
<xsl:variable name='all'>Tutto</xsl:variable>
<xsl:variable name='msgReorderError'>Il numero della riga specificato non esiste</xsl:variable>
<xsl:variable name='currentpasswordprompt'>Immetti la password attuale</xsl:variable>
<xsl:variable name='newpasswordprompt'>Immetti una nuova password</xsl:variable>
<xsl:variable name='confirmpasswordprompt'>Ri-immetti la nuova password</xsl:variable>
<xsl:variable name='save'>Salva</xsl:variable>
<xsl:variable name='newwindow'>Apri in una nuova finestra</xsl:variable>
<xsl:variable name='gettingstarted'>Per iniziare</xsl:variable>
<xsl:variable name='donotshowagain'>Non mostrare di nuovo</xsl:variable>
<xsl:variable name='companylogo'>Logo Cisco</xsl:variable>
<xsl:variable name='results'>risultati</xsl:variable>
<xsl:variable name='editthismodule'>Modifica il modulo</xsl:variable>
<xsl:variable name='remove'>Rimuovi</xsl:variable>
<xsl:variable name='loginproblem'>Problemi durante l'accesso?</xsl:variable>
<xsl:variable name='expandpane'>Espandi</xsl:variable>
<xsl:variable name='collapsepane'>Comprimi</xsl:variable>
<xsl:variable name='restorepane'>Ripristina</xsl:variable>
<xsl:variable name='dateselectionmonth'>Mese per selezione data</xsl:variable>
<xsl:variable name='dateselectionday'>Giorno per selezione data</xsl:variable>
<xsl:variable name='dateselectionyear'>Anno per selezione data</xsl:variable>
<xsl:variable name='timeselectionhour'>Ora per selezione orario</xsl:variable>
<xsl:variable name='timeselectionminute'>Minuto per selezione orario</xsl:variable>
<xsl:variable name='timeselectionampm'>AM o PM per selezione orario</xsl:variable>
<xsl:variable name='and'>e</xsl:variable>
<xsl:variable name='or'>o</xsl:variable>
<xsl:variable name='addfilter'>Aggiungi filtro</xsl:variable>
<xsl:variable name='removefilter'>Rimuovi filtro</xsl:variable>
<xsl:variable name='filterrelationship'>Relazione filtri</xsl:variable>
<xsl:variable name='signin'>Accedi</xsl:variable>
<xsl:variable name='signout'>Disconnetti</xsl:variable>
<xsl:variable name='submenu'>Sottomenu</xsl:variable>
<xsl:variable name='gotopage1'>Vai a pagina 1</xsl:variable>
<xsl:variable name='gotopage2'>Vai a pagina 2</xsl:variable>
<xsl:variable name='gotopage3'>Vai a pagina 3</xsl:variable>
<xsl:variable name='gotopage4'>Vai a pagina 4</xsl:variable>
<xsl:variable name='gotopage5'>Vai a pagina 5</xsl:variable>
<xsl:variable name='gotopage6'>Vai a pagina 6</xsl:variable>
<xsl:variable name='gotopage7'>Vai a pagina 7</xsl:variable>
<xsl:variable name='gotopage8'>Vai a pagina 8</xsl:variable>
<xsl:variable name='gotopage9'>Vai a pagina 9</xsl:variable>
<xsl:variable name='gotopage10'>Vai a pagina 10</xsl:variable>
<xsl:variable name='refresh'>Aggiorna</xsl:variable>
<xsl:variable name='status'>Stato</xsl:variable>
<xsl:variable name='togglefilters'>Attiva/disattiva visualizzazione dei filtri</xsl:variable>
<xsl:variable name='itemsselected'>elementi selezionati</xsl:variable>
<xsl:variable name='bulkvisible'>Tutte le righe visibili di xxx sono selezionate.</xsl:variable>
<xsl:variable name='bulktotal'>Seleziona tutte le righe xxx</xsl:variable>
<xsl:variable name='informationalmessage'>Messaggio informativo</xsl:variable>
<xsl:variable name='criticalerrormessage'>Messaggio errore critico</xsl:variable>
<xsl:variable name='errormessage'>Messaggio di errore</xsl:variable>
<xsl:variable name='warningmessage'>Messaggio di avviso</xsl:variable>
<xsl:variable name='successmessage'>Messaggio di operazione riuscita</xsl:variable>
<xsl:variable name='alert'>Avviso</xsl:variable>
<xsl:variable name='confirm'>Conferma</xsl:variable>
<xsl:variable name='prompt'>Prompt</xsl:variable>
<xsl:variable name='yes'>S&#x00ec;</xsl:variable>
<xsl:variable name='no'>No</xsl:variable>
<xsl:variable name='expandwindow'>Espandi finestra per visualizzare elementi aggiuntivi</xsl:variable>
<xsl:variable name='messagenumber'>Numero messaggio</xsl:variable>
<xsl:variable name='rssfeed'>Feed RSS</xsl:variable>
</xsl:stylesheet>