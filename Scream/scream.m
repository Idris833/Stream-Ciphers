function ciphertext = scream(plaintext, key)
% SCREAMENCRYPT Encrypts plaintext using Scream stream cipher
% Inputs:
%   plaintext: A vector of bytes representing the plaintext
%   key: A vector of bytes representing the key
% Output:
%   ciphertext: A vector of bytes representing the ciphertext

% Check if the plaintext and key have the same length
if length(plaintext) ~= length(key)
    error('Plaintext and key must have the same length');
end

% Initialize the state
state = uint8(0);
ciphertext = zeros(size(plaintext));

% Generate the keystream
for i = 1:length(plaintext)
    % Update the state
    state = bitxor(bitxor(bitand(bitshift(state, 3), 8), ...
        bitxor(state, bitand(bitshift(state, -5), 7))), ...
        bitxor(plaintext(i), key(i)));
    
    % Store the ciphertext
    ciphertext(i) = state;
end

end
