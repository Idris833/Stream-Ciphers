key = 'my_secret_key';
plain_text = 'hello world';
%plain_text2 = '!ïÇ(RÝNdØ}';

plain_text_numeric = double(plain_text); % Convert plain_text to a numeric array
encrypted_text = rc4(key, plain_text_numeric);
disp('Encrypted text: ')
disp(encrypted_text);

encrypted_text_numeric = double(encrypted_text);
decrypted_text = rc4(key, encrypted_text_numeric);
disp('Decrypted text: ')
disp(decrypted_text);
