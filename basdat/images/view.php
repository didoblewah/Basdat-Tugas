<?php

$koneksi = mysqli_connect("localhost", "root", "", "perusahaan");
if (isset($_GET['id'])) {
    $sql = "SELECT * FROM fotomakanan WHERE id=" . $_GET['id'];
    $result = mysqli_query($koneksi, $sql) or die("<b>Error:</b> Ada kesalahan<br/>" . mysqli_error($koneksi));
    $row = mysqli_fetch_array($result);
    header("Content-type: " . $row["tipeimage"]);
    echo $row["dataiamge"];
}
mysqli_close($koneksi);
?>