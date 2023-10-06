plaintext = 'Thesis with Professor Amr!';
%plaintext = ';????XS2????R';

key = 'secret_key';

ciphertext = xor_stream_cipher(plaintext, key);
disp('plaintext: ');
disp(plaintext);
disp('key: ');
disp(key);
disp('ciphertext: ');
disp(char(ciphertext));

disp(' ');

disp('Decrypting the ciphertext... ');
decrypted_ciphertext = xor_stream_cipher(ciphertext, key);
disp('decrypted_ciphertext: ');
disp(char(decrypted_ciphertext));
