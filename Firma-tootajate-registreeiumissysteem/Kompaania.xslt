<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="html" indent="yes" encoding="utf-8"/>

	<xsl:template match="/">
		<html>
			<head>
				<title>Kompaania</title>
			</head>
			<body>
				<h2>Projekti Aruanded</h2>
				<xsl:text disable-output-escaping="yes">
                    <![CDATA[
                    <style>
						#KompaaniaTable {
							margin-left: auto;
							margin-right: auto;
						}
                        #KompaaniaTable, #KompaaniaTable th, #KompaaniaTable td {
                            border: 1px solid black;
                            border-collapse: collapse;
                            padding: 5px;
                        }
                        #KompaaniaTable th {
                            background-color: #0d0d0d;
                            color: #ffffff;
                        }
                    </style>
                    ]]>
                </xsl:text>
				<div style="display: flex; justify-content: space-between; margin-bottom: 10px;">
					<div>
						<label for="filterNimi">Nime otsimine: </label>
						<input type="text" id="filterNimi" onkeyup="filterTable()" placeholder="Sisestage nimi"/>
					</div>
					<div>
						<label for="filterAmet">Amet otsimine: </label>
						<input type="text" id="filterAmet" onkeyup="filterTable()" placeholder="Sisestage amet"/>
					</div>
					<div>
						<label for="filterKuupaev">Kuupäev otsimine: </label>
						<input type="text" id="filterKuupaev" onkeyup="filterTable()" placeholder="Sisestage kuupäev"/>
					</div>
				</div>

				<hr/>

				<table id="KompaaniaTable">
					<tr>
						<td>Nimi</td>
						<td>Amet</td>
						<td>Palk</td>
						<td>Kuupäev</td>
						<td>Töö algus</td>
						<td>Töö lõpp</td>
					</tr>

					<xsl:for-each select="Kompaania/Tootaja">
						<tr>
							<td>
								<xsl:value-of select="nimi-perenimi"/>
							</td>
							<td>
								<xsl:value-of select="amet"/>
							</td>
							<td>
								<xsl:value-of select="palk"/>
							</td>
							<td>
								<xsl:value-of select="igapaevased_andmed/kuupaev"/>
							</td>
							<td>
								<xsl:value-of select="igapaevased_andmed/toopaev_algus"/>
							</td>
							<td>
								<xsl:value-of select="igapaevased_andmed/toopaev_lopp"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
				<xsl:text disable-output-escaping="yes">
                    <![CDATA[
                    <script>
                        function filterTable() {
                            var filterNimi = document.getElementById("filterNimi").value.toLowerCase();
                            var filterKuupaev = document.getElementById("filterKuupaev").value;
                            var filterAmet = document.getElementById("filterAmet").value.toLowerCase();
                            var table = document.getElementById("KompaaniaTable");
                            var rows = table.getElementsByTagName("tr");

                            for (var i = 1; i < rows.length; i++) {

                                var nimiCell = rows[i].getElementsByTagName("td")[0];
                                var ametCell = rows[i].getElementsByTagName("td")[1];
                                var kuupaevCell = rows[i].getElementsByTagName("td")[3];

                                var nimiText = nimiCell ? nimiCell.textContent.toLowerCase() : "";
                                var ametText = ametCell ? ametCell.textContent.toLowerCase() : "";
                                var kuupaevText = kuupaevCell ? kuupaevCell.textContent : "";

                                if ((nimiText.includes(filterNimi) || filterNimi === "") &&
                                    (ametText.includes(filterAmet) || filterAmet === "") &&
                                    (kuupaevText.includes(filterKuupaev) || filterKuupaev === "")) {
                                    rows[i].style.display = "";
                                } else {
                                    rows[i].style.display = "none";
                                }
                            }
                        }
                    </script>
                    ]]>
                </xsl:text>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
