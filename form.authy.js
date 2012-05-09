var Authy = {};

Authy.UI = function() {
    var self = this;
    var countriesList = [
        {"code": "AF", "name": "Afghanistan"}, {"code": "AX", "name": "Aland Islands"}, {"code": "AL", "name": "Albania"},
        {"code": "DZ", "name": "Algeria"}, {"code": "AS", "name": "American Samoa"},{"code": "AD", "name": "Andorra"},
        {"code": "AO", "name": "Angola"}, {"code": "AI", "name": "Anguilla"}, {"code": "AQ", "name": "Antarctica"},
        {"code": "AG", "name": "Antigua and Barbuda"}, {"code": "AR", "name": "Argentina"}, {"code": "AM", "name": "Armenia"},
        {"code": "AW", "name": "Aruba"}, {"code": "AU", "name": "Australia"}, {"code": "AT", "name": "Austria"},
        {"code": "AZ", "name": "Azerbaijan"}, {"code": "BS", "name": "Bahamas"}, {"code": "BH", "name": "Bahrain"},
        {"code": "BD", "name": "Bangladesh"}, {"code": "BB", "name": "Barbados"}, {"code": "BY", "name": "Belarus"},
        {"code": "BE", "name": "Belgium"}, {"code": "BZ", "name": "Belize"}, {"code": "BJ", "name": "Benin"},
        {"code": "BM", "name": "Bermuda"}, {"code": "BT", "name": "Bhutan"}, {"code": "BO", "name": "Bolivia"},
        {"code": "BA", "name": "Bosnia and Herzegovina"}, {"code": "BW", "name": "Botswana"}, {"code": "BV", "name": "Bouvet Island"},
        {"code": "BR", "name": "Brazil"}, {"code": "IO", "name": "British Indian Ocean Territory"}, {"code": "BN", "name": "Brunei Darussalam"},
        {"code": "BG", "name": "Bulgaria"}, {"code": "BF", "name": "Burkina Faso"}, {"code": "BI", "name": "Burundi"},
        {"code": "KH", "name": "Cambodia"}, {"code": "CM", "name": "Cameroon"}, {"code": "CA", "name": "Canada"},
        {"code": "CV", "name": "Cape Verde"}, {"code": "KY", "name": "Cayman Islands"}, {"code": "CF", "name": "Central African Republic"},
        {"code": "TD", "name": "Chad"}, {"code": "CL", "name": "Chile"}, {"code": "CN", "name": "China"},
        {"code": "CX", "name": "Christmas Island"}, {"code": "CC", "name": "Cocos (Keeling) Islands"}, {"code": "CO", "name": "Colombia"},
        {"code": "KM", "name": "Comoros"}, {"code": "CG", "name": "Congo"}, {"code": "CD", "name": "Congo, The Democratic Republic of the"},
        {"code": "CK", "name": "Cook Islands"}, {"code": "CR", "name": "Costa Rica"}, {"code": "CI", "name": "Cote d'Ivoire"},
        {"code": "HR", "name": "Croatia"}, {"code": "CU", "name": "Cuba"}, {"code": "CY", "name": "Cyprus"},
        {"code": "CZ", "name": "Czech Republic"}, {"code": "DK", "name": "Denmark"}, {"code": "DJ", "name": "Djibouti"},
        {"code": "DM", "name": "Dominica"}, {"code": "DO", "name": "Dominican Republic"}, {"code": "EC", "name": "Ecuador"},
        {"code": "EG", "name": "Egypt"}, {"code": "SV", "name": "El Salvador"}, {"code": "GQ", "name": "Equatorial Guinea"},
        {"code": "ER", "name": "Eritrea"}, {"code": "EE", "name": "Estonia"}, {"code": "ET", "name": "Ethiopia"},
        {"code": "FK", "name": "Falkland Islands (Malvinas)"}, {"code": "FO", "name": "Faroe Islands"}, {"code": "FJ", "name": "Fiji"},
        {"code": "FI", "name": "Finland"}, {"code": "FR", "name": "France"}, {"code": "GF", "name": "French Guiana"},
        {"code": "PF", "name": "French Polynesia"}, {"code": "TF", "name": "French Southern Territories"}, {"code": "GA", "name": "Gabon"},
        {"code": "GM", "name": "Gambia"}, {"code": "GE", "name": "Georgia"}, {"code": "DE", "name": "Germany"}, {"code": "GH", "name": "Ghana"},
        {"code": "GI", "name": "Gibraltar"}, {"code": "GR", "name": "Greece"}, {"code": "GL", "name": "Greenland"},
        {"code": "GD", "name": "Grenada"}, {"code": "GP", "name": "Guadeloupe"}, {"code": "GU", "name": "Guam"},
        {"code": "GT", "name": "Guatemala"}, {"code": "GG", "name": "Guernsey"}, {"code": "GN", "name": "Guinea"},
        {"code": "GW", "name": "Guinea-Bissau"}, {"code": "GY", "name": "Guyana"}, {"code": "HT", "name": "Haiti"},
        {"code": "HM", "name": "Heard Island and McDonald Islands"}, {"code": "VA", "name": "Holy See (Vatican City State)"},
        {"code": "HN", "name": "Honduras"}, {"code": "HK", "name": "Hong Kong"}, {"code": "HU", "name": "Hungary"},
        {"code": "IS", "name": "Iceland"}, {"code": "IN", "name": "India"}, {"code": "ID", "name": "Indonesia"},
        {"code": "IR", "name": "Iran, Islamic Republic of"}, {"code": "IQ", "name": "Iraq"}, {"code": "IE", "name": "Ireland"},
        {"code": "IM", "name": "Isle of Man"}, {"code": "IL", "name": "Israel"}, {"code": "IT", "name": "Italy"},
        {"code": "JM", "name": "Jamaica"}, {"code": "JP", "name": "Japan"}, {"code": "JE", "name": "Jersey"},
        {"code": "JO", "name": "Jordan"}, {"code": "KZ", "name": "Kazakhstan"}, {"code": "KE", "name": "Kenya"},
        {"code": "KI", "name": "Kiribati"}, {"code": "KP", "name": "Korea, Democratic People's Republic of"},
        {"code": "KR", "name": "Korea, Republic of"}, {"code": "KW", "name": "Kuwait"}, {"code": "KG", "name": "Kyrgyzstan"},
        {"code": "LA", "name": "Lao People's Democratic Republic"}, {"code": "LV", "name": "Latvia"}, {"code": "LB", "name": "Lebanon"},
        {"code": "LS", "name": "Lesotho"}, {"code": "LR", "name": "Liberia"}, {"code": "LY", "name": "Libyan Arab Jamahiriya"},
        {"code": "LI", "name": "Liechtenstein"}, {"code": "LT", "name": "Lithuania"}, {"code": "LU", "name": "Luxembourg"},
        {"code": "MO", "name": "Macao"}, {"code": "MK", "name": "Macedonia, The Former Yugoslav Republic of"},
        {"code": "MG", "name": "Madagascar"}, {"code": "MW", "name": "Malawi"}, {"code": "MY", "name": "Malaysia"},
        {"code": "MV", "name": "Maldives"}, {"code": "ML", "name": "Mali"}, {"code": "MT", "name": "Malta"},
        {"code": "MH", "name": "Marshall Islands"}, {"code": "MQ", "name": "Martinique"}, {"code": "MR", "name": "Mauritania"},
        {"code": "MU", "name": "Mauritius"}, {"code": "YT", "name": "Mayotte"}, {"code": "MX", "name": "Mexico"},
        {"code": "FM", "name": "Micronesia, Federated States of"}, {"code": "MD", "name": "Moldova"}, {"code": "MC", "name": "Monaco"},
        {"code": "MN", "name": "Mongolia"}, {"code": "ME", "name": "Montenegro"}, {"code": "MS", "name": "Montserrat"},
        {"code": "MA", "name": "Morocco"}, {"code": "MZ", "name": "Mozambique"}, {"code": "MM", "name": "Myanmar"},
        {"code": "NA", "name": "Namibia"}, {"code": "NR", "name": "Nauru"}, {"code": "NP", "name": "Nepal"}, {"code": "NL", "name": "Netherlands"},
        {"code": "AN", "name": "Netherlands Antilles"}, {"code": "NC", "name": "New Caledonia"}, {"code": "NZ", "name": "New Zealand"},
        {"code": "NI", "name": "Nicaragua"}, {"code": "NE", "name": "Niger"}, {"code": "NG", "name": "Nigeria"}, {"code": "NU", "name": "Niue"},
        {"code": "NF", "name": "Norfolk Island"}, {"code": "MP", "name": "Northern Mariana Islands"}, {"code": "NO", "name": "Norway"},
        {"code": "OM", "name": "Oman"}, {"code": "PK", "name": "Pakistan"}, {"code": "PW", "name": "Palau"},
        {"code": "PS", "name": "Palestinian Territory, Occupied"}, {"code": "PA", "name": "Panama"}, {"code": "PG", "name": "Papua New Guinea"},
        {"code": "PY", "name": "Paraguay"}, {"code": "PE", "name": "Peru"}, {"code": "PH", "name": "Philippines"}, {"code": "PN", "name": "Pitcairn"},
        {"code": "PL", "name": "Poland"}, {"code": "PT", "name": "Portugal"}, {"code": "PR", "name": "Puerto Rico"}, {"code": "QA", "name": "Qatar"},
        {"code": "RE", "name": "Reunion"}, {"code": "RO", "name": "Romania"}, {"code": "RU", "name": "Russian Federation"},
        {"code": "RW", "name": "Rwanda"}, {"code": "BL", "name": "Saint Barthelemy"}, {"code": "SH", "name": "Saint Helena"},
        {"code": "KN", "name": "Saint Kitts and Nevis"}, {"code": "LC", "name": "Saint Lucia"}, {"code": "MF", "name": "Saint Martin"},
        {"code": "PM", "name": "Saint Pierre and Miquelon"}, {"code": "VC", "name": "Saint Vincent and the Grenadines"}, {"code": "WS", "name": "Samoa"},
        {"code": "SM", "name": "San Marino"}, {"code": "ST", "name": "Sao Tome and Principe"}, {"code": "SA", "name": "Saudi Arabia"},
        {"code": "SN", "name": "Senegal"}, {"code": "RS", "name": "Serbia"}, {"code": "SC", "name": "Seychelles"}, {"code": "SL", "name": "Sierra Leone"},
        {"code": "SG", "name": "Singapore"}, {"code": "SK", "name": "Slovakia"}, {"code": "SI", "name": "Slovenia"}, {"code": "SB", "name": "Solomon Islands"},
        {"code": "SO", "name": "Somalia"}, {"code": "ZA", "name": "South Africa"}, {"code": "GS", "name": "South Georgia and the South Sandwich Islands"},
        {"code": "ES", "name": "Spain"}, {"code": "LK", "name": "Sri Lanka"}, {"code": "SD", "name": "Sudan"}, {"code": "SR", "name": "Suriname"},
        {"code": "SJ", "name": "Svalbard and Jan Mayen"}, {"code": "SZ", "name": "Swaziland"}, {"code": "SE", "name": "Sweden"},
        {"code": "CH", "name": "Switzerland"}, {"code": "SY", "name": "Syrian Arab Republic"}, {"code": "TW", "name": "Taiwan, Province of China"},
        {"code": "TJ", "name": "Tajikistan"}, {"code": "TZ", "name": "Tanzania, United Republic of"}, {"code": "TH", "name": "Thailand"},
        {"code": "TL", "name": "Timor-Leste"}, {"code": "TG", "name": "Togo"}, {"code": "TK", "name": "Tokelau"}, {"code": "TO", "name": "Tonga"},
        {"code": "TT", "name": "Trinidad and Tobago"}, {"code": "TN", "name": "Tunisia"}, {"code": "TR", "name": "Turkey"},
        {"code": "TM", "name": "Turkmenistan"}, {"code": "TC", "name": "Turks and Caicos Islands"}, {"code": "TV", "name": "Tuvalu"},
        {"code": "UG", "name": "Uganda"}, {"code": "UA", "name": "Ukraine"}, {"code": "AE", "name": "United Arab Emirates"},
        {"code": "GB", "name": "United Kingdom"}, {"code": "US", "name": "United States"}, {"code": "UM", "name": "United States Minor Outlying Islands"},
        {"code": "UY", "name": "Uruguay"}, {"code": "UZ", "name": "Uzbekistan"}, {"code": "VU", "name": "Vanuatu"}, {"code": "VE", "name": "Venezuela"},
        {"code": "VN", "name": "Viet Nam"}, {"code": "VG", "name": "Virgin Islands, British"}, {"code": "VI", "name": "Virgin Islands, U.S."},
        {"code": "WF", "name": "Wallis and Futuna"}, {"code": "EH", "name": "Western Sahara"}, {"code": "YE", "name": "Yemen"},
        {"code": "ZM", "name": "Zambia"}, {"code": "ZW", "name": "Zimbabwe"}
    ];

    var countries = [];

    var setupCellphoneValidation = function() {
        var cellPhone = document.getElementById("authy-cellphone");
        cellPhone.onblur = function(){
          if(cellPhone.value != '' && cellPhone.value.match(/^[\d.-]+$/)){
            cellPhone.style.backgroundColor = "white";
          } else {
            cellPhone.style.backgroundColor = "red";
          }
        }
    };

    var setupAuthyToken = function() {
        var token = document.getElementById("authy-token");

        token.onblur = function() {
          if(token.value != '' && token.value.match(/^\d+$/)){
            token.style.backgroundColor = "white";
          } else {
            token.style.backgroundColor = "red";
          }
        };
    };

    var setupTooltip = function() {
        var tooltip = document.createElement("div");
        tooltip.setAttribute("id", "authy-tooltip");
        var tooltipTop = document.getElementById('authy-help').offsetTop + 20;
        var tooltipLeft = document.getElementById('authy-help').offsetLeft + 20;
        tooltip.setAttribute("style", "top:" + tooltipTop + "px;left:" + tooltipLeft + "px;");
        tooltip.innerHTML = "<a id=\"authy-tooltip-close\"></a><h3>tooltip text</h3> <p>lorem isprum dolor</p>";
        document.body.appendChild(tooltip);
        document.getElementById('authy-help').onclick = function(){ document.getElementById("authy-tooltip").style.display = "block"; };
        document.getElementById('authy-tooltip-close').onclick = function(){ document.getElementById("authy-tooltip").style.display = "none"; };
    };

    var processKey40 = function() {
        var countriesArr = document.getElementById('countries-autocomplete').getElementsByTagName('li');
        for(var i=0; i<countriesArr.length; i++){
            if(document.getElementById('countries-autocomplete').getElementsByTagName('li')[i].className == 'active'){
                document.getElementById('countries-autocomplete').getElementsByTagName('li')[i].className = '';
                if((i+1) == countriesArr.length){
                    document.getElementById('countries-autocomplete').getElementsByTagName('li')[0].className = 'active';
                } else {
                    document.getElementById('countries-autocomplete').getElementsByTagName('li')[i+1].className = 'active';
                }
                return false;
            }
        }
        document.getElementById('countries-autocomplete').getElementsByTagName('li')[0].setAttribute('class', 'active');
    };

    var processKey38 = function() {
        var countriesArr = document.getElementById('countries-autocomplete').getElementsByTagName('li');
        for(var i=countriesArr.length-1; i>=0; i--){
            if(document.getElementById('countries-autocomplete').getElementsByTagName('li')[i].className == 'active'){
                document.getElementById('countries-autocomplete').getElementsByTagName('li')[i].className = '';
                if(i == 0){
                    document.getElementById('countries-autocomplete').getElementsByTagName('li')[countriesArr.length-1].className = 'active';
                } else {
                    document.getElementById('countries-autocomplete').getElementsByTagName('li')[i-1].className = 'active';
                }
                return false;
            }
        }
        document.getElementById('countries-autocomplete').getElementsByTagName('li')[0].setAttribute('class', 'active');
    }

    var processKey13 = function() {
        var obj = document.getElementById('countries-autocomplete').getElementsByClassName('active')[0];
        self.autocomplete(obj);
    }

    var setupEvents = function() {
        var countriesInput = document.getElementById('countries-input');

        countriesInput.onfocus = function() {
            document.getElementById('countries-autocomplete').style.display = "block";
        }

        countriesInput.onkeyup = function(event) {
            document.getElementById('countries-autocomplete').style.display = "block";
            var keyID = event.keyCode;

            switch(keyID) {
                case 13:
                    if(processKey13() == false)
                        return false;
                break;
                case 40:
                    if(processKey40() == false)
                        return false;
                break;
                case 38:
                    if(processKey38() == false)
                        return false;
                break;
            }

            self.searchItem();
        };

        document.getElementById('countries-autocomplete').onclick = function(e){
            if(e && e.stopPropagation) {
                e.stopPropagation();
            } else {
                e = window.event;
                e.cancelBubble = true;
            }
        }

        document.getElementById('countries-input').onclick = function(e){
            if(e && e.stopPropagation) {
                e.stopPropagation();
            } else {
                e = window.event;
                e.cancelBubble = true;
            }
        }

        document.onclick = function() {
            document.getElementById('countries-autocomplete').style.display = "none";
        }


    };

    var setupCountriesDropdown = function() {
        self.countries = [];
        for( var i=0; i < document.getElementById("authy-countries").getElementsByTagName("option").length; i++){
            var buf = [];
            buf[0] = document.getElementById("authy-countries").getElementsByTagName("option")[i].value;
            buf[1] = document.getElementById("authy-countries").getElementsByTagName("option")[i].innerHTML;
            self.countries.push(buf);
        }

        var countriesSelect = document.getElementById("authy-countries");
        var autocompleteTop = document.getElementById('authy-countries').offsetTop + 25;
        var autocompleteLeft = document.getElementById('authy-countries').offsetLeft;
        countriesSelect.setAttribute("style", "display:none");

        var countriesAutocomplete = document.createElement("div");
        countriesAutocomplete.setAttribute("id", "countries-autocomplete");
        countriesAutocomplete.setAttribute("style", "top: " + autocompleteTop  + "px; left: " + autocompleteLeft  + "px;");

        var classActive = '';

        var countriesAutocompleteHTML = '<ul>';

        for( var i=0; i < countriesList.length; i++){
            classActive = (i == 0) ? 'active' : '';
            var country = countriesList[i];
            countriesAutocompleteHTML += '<li class="' + classActive + '" onclick="authyUi.autocomplete(this);return false;" rel="' + country.code + '"><img src="images/flags/' + country.code.toLowerCase() + '.gif" alt="" /> <span>' + country.name + '</span></li>';
        }
        countriesAutocompleteHTML += '</ul>';
        countriesAutocomplete.innerHTML = countriesAutocompleteHTML;

        document.body.appendChild(countriesAutocomplete);

        var countriesInput = document.createElement("input");
        countriesInput.setAttribute("id", "countries-input");
        countriesInput.setAttribute("type", "text");

        countriesSelect.parentNode.insertBefore(countriesInput, countriesSelect);
    };

    this.init = function() {
        setupAuthyToken();
        setupTooltip();
        setupCountriesDropdown();
        setupEvents();
        setupCellphoneValidation();
    }

    this.searchItem = function() {
        var classActive = 'active';
        var str = document.getElementById('countries-input').value;
        var countriesAutocompleteHTML = '<ul>';
        var reg = new RegExp(str, "g");
        for( var i=0; i < this.countriesList.length; i++){

          if(this.countriesList[i].name.toLowerCase().match(reg)) {
            countriesAutocompleteHTML += '<li class="' + classActive + '" onclick="authyUi.autocomplete(this);return false;" rel="' + countriesList[i].code + '"><img src="images/flags/' + this.countriesList[i].code.toLowerCase() + '.gif" alt="" /> <span>' + this.countriesList[i].name + '</span></li>';
            classActive = '';
          }
        }
        countriesAutocompleteHTML += '</ul>';
        document.getElementById('countries-autocomplete').innerHTML = countriesAutocompleteHTML;
    }

    this.autocomplete = function(obj) {
        document.getElementById('countries-input').value = obj.getElementsByTagName('span')[0].innerHTML;
        document.getElementById('countries-autocomplete').style.display = "none";
        document.getElementById('authy-countries').value = obj.getAttribute('rel');
    }
};

window.onload = function() {
    authyUi = new Authy.UI();
    authyUi.init();
}


