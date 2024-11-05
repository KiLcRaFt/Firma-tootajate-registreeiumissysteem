<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">

	<!-- Ensure output is HTML -->
	<xsl:output method="html" indent="yes" />

	<!-- Main template to match the root node and display the data -->
	<xsl:template match="/Kompaania">
		<html>
			<head>
				<title>Projekti Aruanded</title>
			</head>
			<body>
				<h2>Projekti Aruanded</h2>

				<!-- Filter and search inputs -->
				<label for="roleFilter">Filtreeri rolli järgi:</label>
				<input type="text" id="roleFilter" onkeyup="filterByRole()" placeholder="Sisesta roll" />

				<label for="nameSearch">Otsi nime järgi:</label>
				<input type="text" id="nameSearch" onkeyup="searchByName()" placeholder="Sisesta nimi" />

				<!-- Table for displaying employee data -->
				<table id="KompaaniaTable" border="1" cellpadding="5">
					<tr>
						<th onclick="sortTable(0)">Nimi</th>
						<th onclick="sortTable(1)">Amet</th>
						<th onclick="sortTable(2)">Palk</th>
						<th onclick="sortTable(3)">Tööpäev algus</th>
						<th onclick="sortTable(4)">Tööpäev lõpp</th>
					</tr>

					<!-- Loop through each employee in the XML data -->
					<xsl:for-each select="Tootaja">
						<tr>
							<td>
								<xsl:value-of select="nimi-perenimi" />
							</td>
							<td>
								<xsl:value-of select="amet" />
							</td>
							<td>
								<xsl:value-of select="palk" />
							</td>
							<td>
								<xsl:value-of select="igapäevased_andmed/toopaev_algus" />
							</td>
							<td>
								<xsl:value-of select="igapäevased_andmed/toopaev_lopp" />
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
