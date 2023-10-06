function output = panama(key, iv, input)
% Implementation of the PANAMA stream cipher
% key: 128-bit key (binary vector)
% iv: 128-bit initialization vector (binary vector)
% input: input message (string)
% output: encrypted message (string)

% Key setup
key = reshape(dec2bin(key, 128)', 1, []) - '0';
state = key;

% IV setup
iv = reshape(dec2bin(iv, 128)', 1, []) - '0';
state = xor(state, iv);

% Encryption
output = '';
for i = 1:length(input)
    % Nonlinear feedback
    f = xor(state(0+1), state(65+1)) + xor(state(90+1), state(91+1));
    g = xor(state(0+1), state(68+1)) + xor(state(81+1), state(91+1));
    h = xor(state(0+1), state(65+1)) + xor(state(81+1), state(68+1));
    
    % Linear feedback
    t = xor(xor(state(93+1), state(2+1)), xor(f, bitand(g, h)));
    
    % Update state
    state = [state(1+1:end) t];
    
    % Encrypt input character
    output_char = char(bitxor(input(i), state(127+1)) + '0');
    output = [output output_char];
end

end
