using System;
//Para el ArrayList
using System.IO;
using System.Security.Cryptography;
using System.Text;
using ProyTransArte.BeanObjetos;


namespace ProyTransArte.ReglasDeNegocio
{
    

    public class BRSeguridad
    {
        
        static string passPhrase = "Pas5pr@se";        // can be any string
        static string saltValue = "s@1tValue";        // can be any string
        static string hashAlgorithm = "MD5";             // can be "MD5" or SHA1
        static int passwordIterations = 2;                  // can be any number
        static string initVector = "@1B2c3D4e5F6g7H8"; // must be 16 bytes
        static int keySize = 256;                // can be 256, 192 or 128

        public static string encriptar(string plainText)
        {
            if (plainText == "")
            {
                return "";
            }


            // Convert strings into byte arrays.
            // Let us assume that strings only contain ASCII codes.
            // If strings include Unicode characters, use Unicode, UTF7, or UTF8 
            // encoding.
            byte[] initVectorBytes = Encoding.ASCII.GetBytes(initVector);
            byte[] saltValueBytes = Encoding.ASCII.GetBytes(saltValue);

            // Convert our plaintext into a byte array.
            // Let us assume that plaintext contains UTF8-encoded characters.
            byte[] plainTextBytes = Encoding.UTF8.GetBytes(plainText);

            // First, we must create a password, from which the key will be derived.
            // This password will be generated from the specified passphrase and 
            // salt value. The password will be created using the specified hash 
            // algorithm. Password creation can be done in several iterations.
            PasswordDeriveBytes password = new PasswordDeriveBytes(
                                                            passPhrase,
                                                            saltValueBytes,
                                                            hashAlgorithm,
                                                            passwordIterations);

            // Use the password to generate pseudo-random bytes for the encryption
            // key. Specify the size of the key in bytes (instead of bits).
            byte[] keyBytes = password.GetBytes(keySize / 8);

            // Create uninitialized Rijndael encryption object.
            RijndaelManaged symmetricKey = new RijndaelManaged();

            // It is reasonable to set encryption mode to Cipher Block Chaining
            // (CBC). Use default options for other symmetric key parameters.
            symmetricKey.Mode = CipherMode.CBC;

            // Generate encryptor from the existing key bytes and initialization 
            // vector. Key size will be defined based on the number of the key 
            // bytes.
            ICryptoTransform encryptor = symmetricKey.CreateEncryptor(
                                                             keyBytes,
                                                             initVectorBytes);

            // Define memory stream which will be used to hold encrypted data.
            MemoryStream memoryStream = new MemoryStream();

            // Define cryptographic stream (always use Write mode for encryption).
            CryptoStream cryptoStream = new CryptoStream(memoryStream,
                                                         encryptor,
                                                         CryptoStreamMode.Write);
            // Start encrypting.
            cryptoStream.Write(plainTextBytes, 0, plainTextBytes.Length);

            // Finish encrypting.
            cryptoStream.FlushFinalBlock();

            // Convert our encrypted data from a memory stream into a byte array.
            byte[] cipherTextBytes = memoryStream.ToArray();

            // Close both streams.
            memoryStream.Close();
            cryptoStream.Close();

            // Convert encrypted data into a base64-encoded string.
            string cipherText = Convert.ToBase64String(cipherTextBytes);

            // Return encrypted string.
            return cipherText;
        }
        public static string desencriptar(string cipherText)
        {
            if (cipherText == "jhieHLFHpGZM+y4FG/qBaA==" || cipherText == "" || cipherText == null)
            {
                return "";
            }else if (cipherText == "NO REGISTRADO"){
                return "NO REGISTRADO";
            }

            
        // Convert strings defining encryption key characteristics into byte
        // arrays. Let us assume that strings only contain ASCII codes.
        // If strings include Unicode characters, use Unicode, UTF7, or UTF8
        // encoding.
        byte[] initVectorBytes = Encoding.ASCII.GetBytes(initVector);
        byte[] saltValueBytes = Encoding.ASCII.GetBytes(saltValue);

        // Convert our ciphertext into a byte array.
        byte[] cipherTextBytes = Convert.FromBase64String(cipherText);

        // First, we must create a password, from which the key will be 
        // derived. This password will be generated from the specified 
        // passphrase and salt value. The password will be created using
        // the specified hash algorithm. Password creation can be done in
        // several iterations.
        PasswordDeriveBytes password = new PasswordDeriveBytes(
                                                        passPhrase,
                                                        saltValueBytes,
                                                        hashAlgorithm,
                                                        passwordIterations);

        // Use the password to generate pseudo-random bytes for the encryption
        // key. Specify the size of the key in bytes (instead of bits).
        byte[] keyBytes = password.GetBytes(keySize / 8);

        // Create uninitialized Rijndael encryption object.
        RijndaelManaged symmetricKey = new RijndaelManaged();

        // It is reasonable to set encryption mode to Cipher Block Chaining
        // (CBC). Use default options for other symmetric key parameters.
        symmetricKey.Mode = CipherMode.CBC;

        // Generate decryptor from the existing key bytes and initialization 
        // vector. Key size will be defined based on the number of the key 
        // bytes.
        ICryptoTransform decryptor = symmetricKey.CreateDecryptor(
                                                         keyBytes,
                                                         initVectorBytes);

        // Define memory stream which will be used to hold encrypted data.
        MemoryStream memoryStream = new MemoryStream(cipherTextBytes);

        // Define cryptographic stream (always use Read mode for encryption).
        CryptoStream cryptoStream = new CryptoStream(memoryStream,
                                                      decryptor,
                                                      CryptoStreamMode.Read);

        // Since at this point we don't know what the size of decrypted data
        // will be, allocate the buffer long enough to hold ciphertext;
        // plaintext is never longer than ciphertext.
        byte[] plainTextBytes = new byte[cipherTextBytes.Length];

        // Start decrypting.
        int decryptedByteCount = cryptoStream.Read(plainTextBytes,
                                                   0,
                                                   plainTextBytes.Length);

        // Close both streams.
        memoryStream.Close();
        cryptoStream.Close();

        // Convert decrypted data into a string. 
        // Let us assume that the original plaintext string was UTF8-encoded.
        string plainText = Encoding.UTF8.GetString(plainTextBytes,
                                                   0,
                                                   decryptedByteCount);

        // Return decrypted string.   
        return plainText;
    }

        public static void VerificarIntegridadCompleta(BeanUsuario usuario)
        {
            BRBitacora.validarIntegridadHorizontal(usuario);
    //        BRCodPostal.validarIntegridadHorizontal(usuario);
            BRCriticidad.validarIntegridadHorizontal(usuario);
            BRDetalleFactura.validarIntegridadHorizontal(usuario);
            BRDomicilio.validarIntegridadHorizontal(usuario);
            BRDVVertical.validarIntegridadHorizontal(usuario);
            BREncabezadoFactura.validarIntegridadHorizontal(usuario);
            BREstadoServicio.validarIntegridadHorizontal(usuario);
            BRGrupos.validarIntegridadHorizontal(usuario);
            BRGruposPermisos.validarIntegridadHorizontal(usuario);
            BRHojaDeRuta.validarIntegridadHorizontal(usuario);
            BRMantenimientos.validarIntegridadHorizontal(usuario);
            BRObrasDeArte.validarIntegridadHorizontal(usuario);
            BRPermisos.validarIntegridadHorizontal(usuario);
            BRServicio_ServicioExtra.validarIntegridadHorizontal(usuario);
            BRServicios.validarIntegridadHorizontal(usuario);
            BRServiciosExtra.validarIntegridadHorizontal(usuario);
            BRServicios_domicilio.validarIntegridadHorizontal(usuario);
            BRTelefonos.validarIntegridadHorizontal(usuario);
            BRTipoFactura.validarIntegridadHorizontal(usuario);
            BRUsuarios.validarIntegridadHorizontal(usuario);
            BRUsuarios_Grupos.validarIntegridadHorizontal(usuario);
            BRUsuariosPermisos.validarIntegridadHorizontal(usuario);
            BRVehiculos.validarIntegridadHorizontal(usuario);
            BRVehiculos_Servicios.validarIntegridadHorizontal(usuario);
        }
        public static void corregirIntegridadCompleta(BeanUsuario usuario)
        {
            BRBitacora.corregirIntegridad();
            //BRCodPostal.corregirIntegridad();
            BRCriticidad.corregirIntegridad();
            BRDetalleFactura.corregirIntegridad();
            BRDomicilio.corregirIntegridad();
            BRDVVertical.corregirIntegridad();
            BREncabezadoFactura.corregirIntegridad();
            BREstadoServicio.corregirIntegridad();
            BRGrupos.corregirIntegridad();
            BRGruposPermisos.corregirIntegridad();
            BRHojaDeRuta.corregirIntegridad();
            BRMantenimientos.corregirIntegridad();
            BRObrasDeArte.corregirIntegridad();
            BRPermisos.corregirIntegridad();
            BRServicio_ServicioExtra.corregirIntegridad();
            BRServicios.corregirIntegridad();
            BRServicios_domicilio.corregirIntegridad();
            BRServiciosExtra.corregirIntegridad();
            BRTelefonos.corregirIntegridad();
            BRTipoFactura.corregirIntegridad();
            BRUsuarios.corregirIntegridad();
            BRUsuarios_Grupos.corregirIntegridad();
            BRUsuariosPermisos.corregirIntegridad();
            BRVehiculos.corregirIntegridad();
            BRVehiculos_Servicios.corregirIntegridad();
        }

    }

}