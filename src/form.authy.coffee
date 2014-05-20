window.Authy = {}

# Fix Internet Explorer by defining getElementsByClassName
unless document.getElementsByClassName?
  document.getElementsByClassName = (className, parentElement) ->
    children = (parentElement || document.body).getElementsByTagName("*")
    elements = []
    child = undefined
    i = 0
    length = children.length

    while i < length
      child = children[i]
      elements.push child  unless (" " + child.className + " ").indexOf(" " + className + " ") is -1
      i++
    return elements

  HTMLDivElement::getElementsByClassName = (className) ->
    return document.getElementsByClassName className, this

window.Authy.UI = ->

  # Attributes
  self = this
  tooltipTitle = "Authy Help Tooltip"
  tooltipMessage = "This is a help tooltip for your users. You can set the message by doing: authyUI.setTooltip(\"title\", \"message\");"

  countriesList = [
      {"country":"United States of America (+1)","code":"1"},{"country":"Canada (+1)","code":"1"},{"country":"Russia (+7)","code":"7"},
      {"country":"Kazakhstan (+7)","code":"7"},{"country":"Egypt (+20)","code":"20"},{"country":"South Africa (+27)","code":"27"},
      {"country":"Greece (+30)","code":"30"},{"country":"Netherlands (+31)","code":"31"},{"country":"Belgium (+32)","code":"32"},
      {"country":"France (+33)","code":"33"},{"country":"Spain (+34)","code":"34"},{"country":"Hungary (+36)","code":"36"},
      {"country":"Italy (+39)","code":"39"},{"country":"Romania (+40)","code":"40"},{"country":"Switzerland (+41)","code":"41"},
      {"country":"Austria (+43)","code":"43"},{"country":"United Kingdom (+44)","code":"44"},{"country":"Guernsey (+44)","code":"44"},
      {"country":"Isle of Man (+44)","code":"44"},{"country":"Jersey (+44)","code":"44"},{"country":"Denmark (+45)","code":"45"},
      {"country":"Sweden (+46)","code":"46"},{"country":"Norway (+47)","code":"47"},{"country":"Poland (+48)","code":"48"},
      {"country":"Germany (+49)","code":"49"},{"country":"Peru (+51)","code":"51"},{"country":"Mexico (+52)","code":"52"},
      {"country":"Cuba (+53)","code":"53"},{"country":"Argentina (+54)","code":"54"},{"country":"Brazil (+55)","code":"55"},
      {"country":"Chile (+56)","code":"56"},{"country":"Colombia (+57)","code":"57"},{"country":"Venezuela (+58)","code":"58"},
      {"country":"Malaysia (+60)","code":"60"},{"country":"Australia (+61)","code":"61"},{"country":"Indonesia (+62)","code":"62"},
      {"country":"Philippines (+63)","code":"63"},{"country":"New Zealand (+64)","code":"64"},{"country":"Singapore (+65)","code":"65"},
      {"country":"Thailand (+66)","code":"66"},{"country":"Japan (+81)","code":"81"},{"country":"Korea (+South) (+82)","code":"82"},
      {"country":"Vietnam (+84)","code":"84"},{"country":"China (+86)","code":"86"},{"country":"Turkey (+90)","code":"90"},
      {"country":"India (+91)","code":"91"},{"country":"Pakistan (+92)","code":"92"},{"country":"Afghanistan (+93)","code":"93"},
      {"country":"Sri Lanka (+94)","code":"94"},{"country":"Myanmar (+95)","code":"95"},{"country":"Iran (+98)","code":"98"},
      {"country":"Morocco (+212)","code":"212"},{"country":"Algeria (+213)","code":"213"},{"country":"Tunisia (+216)","code":"216"},
      {"country":"Libya (+218)","code":"218"},{"country":"Gambia (+220)","code":"220"},{"country":"Senegal (+221)","code":"221"},
      {"country":"Mauritania (+222)","code":"222"},{"country":"Mali Republic (+223)","code":"223"},{"country":"Guinea (+224)","code":"224"},
      {"country":"Ivory Coast (+225)","code":"225"},{"country":"Burkina Faso (+226)","code":"226"},{"country":"Niger (+227)","code":"227"},
      {"country":"Togo (+228)","code":"228"},{"country":"Benin (+229)","code":"229"},{"country":"Mauritius (+230)","code":"230"},
      {"country":"Liberia (+231)","code":"231"},{"country":"Sierra Leone (+232)","code":"232"},{"country":"Ghana (+233)","code":"233"},
      {"country":"Nigeria (+234)","code":"234"},{"country":"Chad (+235)","code":"235"},{"country":"Central African Republic (+236)","code":"236"},
      {"country":"Cameroon (+237)","code":"237"},{"country":"Cape Verde Islands (+238)","code":"238"},{"country":"Sao Tome and Principe (+239)","code":"239"},
      {"country":"Gabon (+241)","code":"241"},{"country":"Congo, Democratic Republ (+243)","code":"243"},{"country":"Angola (+244)","code":"244"},
      {"country":"Guinea-Bissau (+245)","code":"245"},{"country":"Seychelles (+248)","code":"248"},{"country":"Sudan (+249)","code":"249"},
      {"country":"Rwanda (+250)","code":"250"},{"country":"Ethiopia (+251)","code":"251"},{"country":"Somalia (+252)","code":"252"},
      {"country":"Djibouti (+253)","code":"253"},{"country":"Kenya (+254)","code":"254"},{"country":"Tanzania (+255)","code":"255"},
      {"country":"Uganda (+256)","code":"256"},{"country":"Burundi (+257)","code":"257"},{"country":"Mozambique (+258)","code":"258"},
      {"country":"Zambia (+260)","code":"260"},{"country":"Madagascar (+261)","code":"261"},{"country":"Reunion (+262)","code":"262"},
      {"country":"Zimbabwe (+263)","code":"263"},{"country":"Namibia (+264)","code":"264"},{"country":"Malawi (+265)","code":"265"},
      {"country":"Lesotho (+266)","code":"266"},{"country":"Botswana (+267)","code":"267"},{"country":"Swaziland (+268)","code":"268"},
      {"country":"Mayotte Island (+269)","code":"269"},{"country":"Aruba (+297)","code":"297"},{"country":"Faroe Islands (+298)","code":"298"},
      {"country":"Greenland (+299)","code":"299"},{"country":"Gibraltar (+350)","code":"350"},{"country":"Portugal (+351)","code":"351"},
      {"country":"Luxembourg (+352)","code":"352"},{"country":"Ireland (+353)","code":"353"},{"country":"Iceland (+354)","code":"354"},
      {"country":"Albania (+355)","code":"355"},{"country":"Malta (+356)","code":"356"},{"country":"Cyprus (+357)","code":"357"},
      {"country":"Finland (+358)","code":"358"},{"country":"Bulgaria (+359)","code":"359"},{"country":"Lithuania (+370)","code":"370"},
      {"country":"Latvia (+371)","code":"371"},{"country":"Estonia (+372)","code":"372"},{"country":"Moldova (+373)","code":"373"},
      {"country":"Armenia (+374)","code":"374"},{"country":"Belarus (+375)","code":"375"},{"country":"Andorra (+376)","code":"376"},
      {"country":"Monaco (+377)","code":"377"},{"country":"San Marino (+378)","code":"378"},{"country":"Ukraine (+380)","code":"380"},
      {"country":"Serbia (+381)","code":"381"},{"country":"Montenegro (+382)","code":"382"},{"country":"Croatia (+385)","code":"385"},
      {"country":"Slovenia (+386)","code":"386"},{"country":"Bosnia-Herzegovina (+387)","code":"387"},{"country":"Macedonia (+389)","code":"389"},
      {"country":"Czech Republic (+420)","code":"420"},{"country":"Slovakia (+421)","code":"421"},{"country":"Liechtenstein (+423)","code":"423"},
      {"country":"Falkland Islands (+500)","code":"500"},{"country":"Belize (+501)","code":"501"},{"country":"Guatemala (+502)","code":"502"},
      {"country":"El Salvador (+503)","code":"503"},{"country":"Honduras (+504)","code":"504"},{"country":"Nicaragua (+505)","code":"505"},
      {"country":"Costa Rica (+506)","code":"506"},{"country":"Panama (+507)","code":"507"},{"country":"Haiti (+509)","code":"509"},
      {"country":"Guadeloupe (+590)","code":"590"},{"country":"Bolivia (+591)","code":"591"},{"country":"Guyana (+592)","code":"592"},
      {"country":"Ecuador (+593)","code":"593"},{"country":"French Guiana (+594)","code":"594"},{"country":"Paraguay (+595)","code":"595"},
      {"country":"Martinique (+596)","code":"596"},{"country":"Suriname (+597)","code":"597"},{"country":"Uruguay (+598)","code":"598"},
      {"country":"Netherlands Antilles (+599)","code":"599"},{"country":"Timor-Leste (+670)","code":"670"},{"country":"Guam (+671)","code":"671"},
      {"country":"Brunei (+673)","code":"673"},{"country":"Nauru (+674)","code":"674"},{"country":"Papua New Guinea (+675)","code":"675"},
      {"country":"Tonga (+676)","code":"676"},{"country":"Solomon Islands (+677)","code":"677"},{"country":"Vanuatu (+678)","code":"678"},
      {"country":"Fiji Islands (+679)","code":"679"},{"country":"Cook Islands (+682)","code":"682"},{"country":"Samoa (+685)","code":"685"},
      {"country":"New Caledonia (+687)","code":"687"},{"country":"French Polynesia (+689)","code":"689"},{"country":"Korea (+North) (+850)","code":"850"},
      {"country":"HongKong (+852)","code":"852"},{"country":"Macau (+853)","code":"853"},{"country":"Cambodia (+855)","code":"855"},
      {"country":"Laos (+856)","code":"856"},{"country":"Bangladesh (+880)","code":"880"},{"country":"International (+882)","code":"882"},
      {"country":"Taiwan (+886)","code":"886"},{"country":"Maldives (+960)","code":"960"},{"country":"Lebanon (+961)","code":"961"},
      {"country":"Jordan (+962)","code":"962"},{"country":"Syria (+963)","code":"963"},{"country":"Iraq (+964)","code":"964"},
      {"country":"Kuwait (+965)","code":"965"},{"country":"Saudi Arabia (+966)","code":"966"},{"country":"Yemen (+967)","code":"967"},
      {"country":"Oman (+968)","code":"968"},{"country":"Palestine (+970)","code":"970"},{"country":"United Arab Emirates (+971)","code":"971"},
      {"country":"Israel (+972)","code":"972"},{"country":"Bahrain (+973)","code":"973"},{"country":"Qatar (+974)","code":"974"},
      {"country":"Bhutan (+975)","code":"975"},{"country":"Mongolia (+976)","code":"976"},{"country":"Nepal (+977)","code":"977"},
      {"country":"Tajikistan (+992)","code":"992"},{"country":"Turkmenistan (+993)","code":"993"},{"country":"Azerbaijan (+994)","code":"994"},
      {"country":"Georgia (+995)","code":"995"},{"country":"Kyrgyzstan (+996)","code":"996"},{"country":"Uzbekistan (+998)","code":"998"},
      {"country":"Bahamas (+1242)","code":"1242"},{"country":"Barbados (+1246)","code":"1246"},{"country":"Anguilla (+1264)","code":"1264"},
      {"country":"Antigua and Barbuda (+1268)","code":"1268"},{"country":"Virgin Islands, British (+1284)","code":"1284"},{"country":"Cayman Islands (+1345)","code":"1345"},
      {"country":"Bermuda (+1441)","code":"1441"},{"country":"Grenada (+1473)","code":"1473"},{"country":"Turks and Caicos Islands (+1649)","code":"1649"},
      {"country":"Montserrat (+1664)","code":"1664"},{"country":"Saint Lucia (+1758)","code":"1758"},{"country":"Dominica (+1767)","code":"1767"},
      {"country":"St. Vincent and The Gren (+1784)","code":"1784"},{"country":"Puerto Rico (+1787)","code":"1787"},{"country":"Dominican Republic (+1809)","code":"1809"},
      {"country":"Dominican Republic2 (+1829)","code":"1829"},{"country":"Dominican Republic3 (+1849)","code":"1849"},{"country":"Trinidad and Tobago (+1868)","code":"1868"},
      {"country":"Saint Kitts and Nevis (+1869)","code":"1869"},{"country":"Jamaica (+1876)","code":"1876"},{"country":"Congo (+2420)","code":"2420"}
    ]



  # Private Members

  #validates the cellphone is not null and partially correct
  setupCellphoneValidation = ->
    cellPhone = document.getElementById("authy-cellphone")
    return  unless cellPhone
    cellPhone.onblur = ->
      if cellPhone.value != "" and cellPhone.value.match(/^([0-9][0-9][0-9])\W*([0-9][0-9]{2})\W*([0-9]{0,5})$/)
        cellPhone.style.backgroundColor = "white"
      else
        cellPhone.style.backgroundColor = "#F2DEDE"
    return


   #Validates Authy token is not null
   setupAuthyTokenValidation = ->
    token = document.getElementById("authy-token")
    return  unless token
    token.onblur = ->
      if token.value != "" and token.value.match(/^\d+$/)
        token.style.backgroundColor = "white"
      else
        token.style.backgroundColor = "#F2DEDE"

    return

  #Disable the autocomplete on Authy Token input
  disableAutocompleteAuthyToken = ->
    token = document.getElementById("authy-token")
    return unless token
    token.setAttribute "autocomplete", "off"

    return

  #Sets the help toolTip
  setupTooltip = ->
    authy_help = document.getElementById("authy-help")
    return  unless authy_help
    tooltip = document.createElement("div")
    tooltip.setAttribute "id", "authy-tooltip"
    tooltip.innerHTML = "<a id=\"authy-tooltip-close\"></a><h3 class=\"tooltip-title\">" + tooltipTitle + "</h3><p class=\"tooltip-content\">" + tooltipMessage + "</p>"
    document.body.appendChild tooltip

    document.getElementById("authy-help").onclick = ->
      #reposition the tooltip
      tooltip = document.getElementById("authy-tooltip")
      setupTooltipPosition(this, tooltip)
      tooltip.style.display = "block"

    document.getElementById("authy-tooltip-close").onclick = ->
      document.getElementById("authy-tooltip").style.display = "none"

    setupTooltipPosition(authy_help, tooltip)

    return

  #
  # Set the tooltip position
  #
  setupTooltipPosition = (helpLink, tooltip) ->
    pos = absolutePosFor(helpLink)
    tooltipTop = pos[0]
    tooltipLeft = pos[1] + helpLink.offsetWidth + 5
    tooltip.setAttribute "style", "top:" + tooltipTop + "px;left:" + tooltipLeft + "px;"


  # Process the down-arrow key
  processKey40 = (listId) ->
    caId = "countries-autocomplete-" + listId
    countriesDropdown = document.getElementById(caId)
    countriesArr =  countriesDropdown.getElementsByTagName("li")

    i = 0
    for li in countriesArr #search all the array which is active and set the next one as active
      if li.className == "active" && countriesArr.length > (i + 1)
        activeElement = countriesArr[i + 1]
        li.className = ""
        # countriesDropdown.scrollTo(0, selectedLi.offsetTop)
        setActive(activeElement)
        self.autocomplete(activeElement, false)
        break
      i++
    return false


  #process the up arrow key
  processKey38 = (listId) ->
    caId = "countries-autocomplete-" + listId
    countriesArr = document.getElementById(caId).getElementsByTagName("li")
    i = countriesArr.length - 1

    while i >= 0
      if document.getElementById(caId).getElementsByTagName("li")[i].className == "active"
        document.getElementById(caId).getElementsByTagName("li")[i].className = ""
        activeElement = null
        if i == 0
          activeElement = document.getElementById(caId).getElementsByTagName("li")[countriesArr.length - 1]
        else
          activeElement = document.getElementById(caId).getElementsByTagName("li")[i - 1]

        setActive(activeElement)
        self.autocomplete(activeElement, false)
        return false
      i--
    document.getElementById(caId).getElementsByTagName("li")[0].setAttribute("class", "active")

    return


  #
  # Process the enter key
  #
  processKey13 = (listId) ->
    obj = document.getElementById("countries-autocomplete-" + listId).getElementsByClassName("active")[0]
    self.autocomplete(obj, true)
    return false

  setActive = (liElement) ->
    listId = liElement.getAttribute("data-list-id")
    liElements = document.getElementById("countries-autocomplete-" + listId).getElementsByTagName("li")
    for li in liElements
      li.className = ""

    liElement.className = "active"

  #
  # Setup to handle the keyboard input events
  #
  setupEvents = (countriesInput, listId) ->
    return  unless countriesInput

    countriesInput.onblur = (event) ->
      processKey13(listId)

    countriesInput.onfocus = ->
      countriesDropdown = document.getElementById("countries-autocomplete-" + listId)
      setupCountriesDropdownPosition(countriesInput, countriesDropdown )
      countriesDropdown.style.display = "block"
      return

    countriesInput.onkeyup = (event) ->
      document.getElementById("countries-autocomplete-" + listId).style.display = "block"
      keyID = getKeyCode(event)
      switch keyID
        when 13 # enter key
          processKey13(listId)
          return false
        when 40 # down key
          return false  if processKey40(listId) == false
        when 38 # up key
          return false  if processKey38(listId) == false
      self.searchItem listId

    countriesInput.onkeypress = (event) ->
      if getKeyCode(event) == 13
        processKey13(listId) # Enter key
        return false

    document.getElementById("countries-autocomplete-" + listId).onclick = (e) ->
      if e && e.stopPropagation
        hideAutocompleteList(listId)
        e.stopPropagation()
      else
        e = window.event
        e.cancelBubble = true

    document.getElementById("countries-input-" + listId).onclick = (e) ->
      if e && e.stopPropagation
        e.stopPropagation()
        countriesInput.focus()
        countriesInput.select()
      else
        e = window.event
        e.cancelBubble = true

    document.onclick = ->
      hideAutocompleteList(listId)
      return

  hideAutocompleteList = (listId) ->
    autocompleteList = document.getElementById("countries-autocomplete-" + listId)
    if autocompleteList
      return autocompleteList.style.display = "none"

    return

  #
  # Returns each country code <li> item
  #
  buildItem = (classActive, country, listId) ->
    cc = country.country.substring(0, 2).toLowerCase() + country.code
    li = document.createElement("li")
    li.setAttribute("class", classActive)
    li.setAttribute("data-list-id", listId)
    li.setAttribute("rel", country.code)
    li.setAttribute("data-name", country.country)

    li.onmouseover = (event) ->
      setActive(li)

    flag = document.createElement("span")
    flag.setAttribute("class", "aflag flag-#{cc}")
    li.appendChild(flag)

    name = document.createElement("span")
    name.innerHTML = country.country
    li.appendChild(name)

    return li

  #
  # Given an element returns it absolute position
  #
  absolutePosFor = (element) ->
    absTop = 0
    absLeft = 0
    while element
      absTop += element.offsetTop
      absLeft += element.offsetLeft
      element = element.offsetParent
    return [absTop, absLeft]


  #
  # Sets up the countriesDropDown
  #
  setupCountriesDropdown = (countriesSelect, listId) ->
    return  unless countriesSelect
    countries = []
    i = 0

    while i < countriesSelect.getElementsByTagName("option").length
      buf = []
      buf[0] = countriesSelect.getElementsByTagName("option")[i].value
      buf[1] = countriesSelect.getElementsByTagName("option")[i].innerHTML
      countries.push buf
      i++

    countriesSelect.setAttribute "style", "display:none"
    name = countriesSelect.getAttribute("name")
    countriesSelect.removeAttribute "name"

    countriesDropdown = document.createElement("div")
    countryCodeValue = document.createElement("input")
    countryCodeValue.setAttribute "type", "hidden"
    countryCodeValue.setAttribute "id", "country-code-" + listId
    countryCodeValue.setAttribute "name", name

    classActive = ""
    countriesAutocompleteList = document.createElement("ul")
    i = 0

    while i < countriesList.length
      classActive = (if (i is 0) then "active" else "")
      countriesAutocompleteList.appendChild(buildItem(classActive, countriesList[i], listId))
      i++

    countriesDropdown.innerHTML = ""
    countriesDropdown.appendChild(countriesAutocompleteList)
    document.body.appendChild countriesDropdown

    countriesInput = document.createElement("input")
    countriesInput.setAttribute "id", "countries-input-" + listId
    countriesInput.setAttribute "class", "countries-input"
    countriesInput.setAttribute "type", "text"
    countriesInput.setAttribute "autocomplete", "off"

    placeholder = countriesSelect.getAttribute("placeholder")
    if placeholder?
      countriesSelect.removeAttribute "placeholder"
      countriesInput.setAttribute "placeholder", placeholder

    countriesSelect.parentNode.insertBefore countriesInput, countriesSelect
    countriesSelect.parentNode.appendChild countryCodeValue

    countriesDropdown.setAttribute "id", "countries-autocomplete-" + listId
    countriesDropdown.setAttribute "class", "countries-autocomplete"

    setupCountriesDropdownPosition(countriesInput, countriesDropdown)

    setupEvents countriesInput, listId
    return

  #
  # Calculates the country dropdown position based on the countriesInput
  #
  setupCountriesDropdownPosition = (countriesInput, countriesDropdown) ->
    pos = absolutePosFor(countriesInput)

    width = countriesInput.offsetWidth
    if width < 220
      width = 220
    countriesDropdown.setAttribute "style", "width: " + (width - 5) + "px; top: " + (pos[0] + 2 + countriesInput.offsetHeight) + "px; left: " + (pos[1] - 2) + "px;"

  #
  # If there are multiple countries dropdows, finds each one and sets a countries Dropdown
  #
  findAndSetupCountries = ->
    authyCountries = document.getElementById("authy-countries")
    if authyCountries
      setupCountriesDropdown authyCountries, 0

    countries = document.getElementsByClassName("authy-countries")
    i = 0

    while i < countries.length
      setupCountriesDropdown countries[i], i + 1
      i++
    return

  #
  # Display the country code that was selected before submitting the form
  #
  setCountryField = ->
    defaultListId = 0
    field = document.getElementById("authy-countries")
    return unless field
    countryCode = field.value

    if countryCode isnt ''
      for country in countriesList
        if country.code is countryCode
          self.autocomplete(buildItem('active', country, defaultListId), true)
          break

  getKeyCode = (event) ->
    if event && event.which #others
      keyCode = event.which
    else if window.event
      keyCode = window.event.keyCode

    return keyCode




  ###########
  # Public Members
  ###########

  @init = ->
    setupAuthyTokenValidation()
    disableAutocompleteAuthyToken()
    setupTooltip()
    findAndSetupCountries()
    setCountryField()
    setupCellphoneValidation()


  @searchItem = (listId) ->
    classActive = "active"
    countriesInput = document.getElementById("countries-input-" + listId)
    str = countriesInput.value
    countriesAutocompleteList = document.createElement("ul")
    firstCountryCodeFound = null
    matches = false
    str = str.replace(/[-[\]{}()*+?.,\\^$|#\s]/g, "\\$&") # Escape regular expression special characters
    reg = new RegExp("^" + str, "i")
    i = 0

    while i < countriesList.length
      countryItem = countriesList[i]
      countryWords = countryItem.country.toLowerCase().split(/\s+/)

      # Capture words starting with the entered pattern
      cw = 0

      while cw < countryWords.length
        if (countryWords[cw].length > 2 && countryWords[cw].match(reg)) || "#{countryItem.code}".match(reg)
          countriesAutocompleteList.appendChild(buildItem(classActive, countryItem, listId))
          classActive = ""
          matches = true
          firstCountryCodeFound = countryItem.code unless firstCountryCodeFound?
          break
        cw++
      i++

    if matches
      dropdownMenu = document.getElementById("countries-autocomplete-" + listId)
      dropdownMenu.innerHTML = ""
      dropdownMenu.appendChild(countriesAutocompleteList)
      self.setCountryCode(listId, firstCountryCodeFound)

  @autocomplete = (obj, hideList) ->
    listId = obj.getAttribute("data-list-id")
    document.getElementById("countries-input-" + listId).value = obj.getAttribute("data-name")
    self.setCountryCode(listId, obj.getAttribute("rel"))
    if hideList
      hideAutocompleteList(listId)
    return

  @setCountryCode = (listId, countryCode) ->
    document.getElementById("country-code-" + listId).value = countryCode

  @setTooltip = (title, msg) ->
    tooltip = document.getElementById("authy-tooltip")
    return  unless tooltip
    tooltip.getElementsByClassName("tooltip-title")[0].innerHTML = title
    tooltip.getElementsByClassName("tooltip-content")[0].innerHTML = msg
    return

  return #class return
Authy.UI.instance = ->
  unless @ui
    @ui = new Authy.UI()
    @ui.init()
  @ui

window.onload = ->
  Authy.UI.instance()





