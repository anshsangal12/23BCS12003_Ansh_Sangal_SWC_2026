Select S.date,
count(A.Action)/ count(S.action)::Decimal
From
fb_friend_requests AS S
Left join
fb_friend_requests AS A
ON
S.user_id_sender = A.user_id_sender
And
S.user_id_receiver = A.user_id_receiver
And
A.action = 'accepted'
where
S.action='sent'
Group By S.Date;
