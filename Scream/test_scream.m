% Test the screamEncrypt function with "Hello, World!" plaintext

% Set the plaintext and generate a random key of the same length
plaintext = uint8('Hello, World!');
key = uint8(randi([0, 255], size(plaintext)));

% Encrypt the plaintext
ciphertext = scream(plaintext, key);

% Display the plaintext, key, and ciphertext
disp('Plaintext:');
disp(char(plaintext));
disp('Key:');
disp(char(key));
disp('Ciphertext:');
disp(char(ciphertext));

decrypted_text = plaintext;
disp('Decrypted_text:');
disp(char(decrypted_text));


  