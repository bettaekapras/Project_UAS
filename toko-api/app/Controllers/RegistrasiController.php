<?php

namespace App\Controllers;

use App\Models\MRegistrasi;

class RegistrasiController extends RestfulController
{
    public function registrasi()
    {
        $nama = $this->request->getVar('nama');
        $email = $this->request->getVar('email');
        $password = $this->request->getVar('password');

        // Validasi data input
        if (empty($nama) || empty($email) || empty($password))
        {
            return $this->responseHasil(400, false, "Nama, Email, dan Password harus diisi");
        }

        // Hash password
        $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

        // Persiapan data untuk disimpan
        $data = [
            'nama' => $nama,
            'email' => $email,
            'password' => $hashedPassword
        ];

        // Simpan data menggunakan model
        $model = new MRegistrasi();
        if ($model->save($data))
        {
            return $this->responseHasil(200, true, "Registrasi Berhasil");
        }
        else
        {
            return $this->responseHasil(500, false, "Registrasi Gagal");
        }
    }
}
