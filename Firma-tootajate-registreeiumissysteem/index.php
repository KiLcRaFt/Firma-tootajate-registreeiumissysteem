<?php
$xmlFile = 'Kompaania.xml';

if (file_exists($xmlFile)) {
    $xml = simplexml_load_file($xmlFile);

    // Get filter and sort parameters
    $filterRole = isset($_GET['roleFilter']) ? strtolower(trim($_GET['roleFilter'])) : '';
    $searchName = isset($_GET['nameSearch']) ? strtolower(trim($_GET['nameSearch'])) : '';
    $sortColumn = isset($_GET['sortColumn']) ? $_GET['sortColumn'] : '';
    $sortOrder = isset($_GET['sortOrder']) ? $_GET['sortOrder'] : 'asc';

    // Convert XML data into an array for easier manipulation
    $reports = [];
    foreach ($xml->Tootaja as $tootaja) {
        $reports[] = $tootaja;
    }

    // Sort the data if a column is specified
    if ($sortColumn) {
        usort($reports, function ($a, $b) use ($sortColumn, $sortOrder) {
            $valueA = strtolower((string) $a->{$sortColumn});
            $valueB = strtolower((string) $b->{$sortColumn});
            return ($sortOrder == 'asc') ? strcmp($valueA, $valueB) : strcmp($valueB, $valueA);
        });
    }

    // Display the filter and search form
    echo '<form method="GET">';
    echo '<label for="roleFilter">Filtreeri rolli järgi:</label>';
    echo '<input type="text" id="roleFilter" name="roleFilter" value="' . htmlspecialchars($filterRole) . '" placeholder="Sisesta amet" />';
    echo '<label for="nameSearch">Otsi nime järgi:</label>';
    echo '<input type="text" id="nameSearch" name="nameSearch" value="' . htmlspecialchars($searchName) . '" placeholder="Sisesta nimi" />';
    echo '<input type="submit" value="Filtreeri" />';
    echo '</form>';

    // Display the table headers with sorting links
    echo '<table border="1" cellpadding="5" id="KompaaniaTable">';
    echo '<tr>
            <th><a href="?sortColumn=nimi-perenimi&sortOrder=' . ($sortOrder == 'asc' ? 'desc' : 'asc') . '">Nimi</a></th>
            <th><a href="?sortColumn=amet&sortOrder=' . ($sortOrder == 'asc' ? 'desc' : 'asc') . '">Amet</a></th>
            <th><a href="?sortColumn=palk&sortOrder=' . ($sortOrder == 'asc' ? 'desc' : 'asc') . '">Palk</a></th>
            <th>Tööpäeva algus</th>
            <th>Tööpäeva lõpp</th>
          </tr>';

    // Display filtered data in the table
    foreach ($reports as $tootaja) {
        $nimi_perenimi = strtolower((string) $tootaja->{'nimi-perenimi'});
        $amet = strtolower((string) $tootaja->amet);
        $palk = (string) $tootaja->palk;
        $toopaev_algus = (string) $tootaja->igapäevased_andmed->toopaev_algus;
        $toopaeva_lopp = (string) $tootaja->igapäevased_andmed->toopaev_lopp;

        // Apply filters
        if (($filterRole && strpos($amet, $filterRole) === false) ||
            ($searchName && strpos($nimi_perenimi, $searchName) === false)) {
            continue;
        }

        // Output row
        echo '<tr>';
        echo '<td>' . htmlspecialchars($tootaja->{'nimi-perenimi'}) . '</td>';
        echo '<td>' . htmlspecialchars($tootaja->amet) . '</td>';
        echo '<td>' . htmlspecialchars($tootaja->palk) . '</td>';
        echo '<td>' . htmlspecialchars($tootaja->$igapäevased_andmed->$toopaev_algus) . '</td>';
        echo '<td>' . htmlspecialchars($tootaja->$igapäevased_andmed->$toopaeva_lopp) . '</td>';
        echo '</tr>';
    }

    echo '</table>';
} else {
    exit('Не удалось открыть Kompaania.xml.');
}
?>
