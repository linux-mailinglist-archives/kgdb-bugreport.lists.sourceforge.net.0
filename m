Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D230B45E29
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  5 Sep 2025 18:30:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KTQhtB1aXfAAr0jS0YtLtSNNP/AUNfHL77xQzffrvII=; b=ZmA31SHIg9/wA3UYlwTY6AMBgq
	OSZnO+fD6kiCm+mWf/1GuB/ZrT1BvXl6n0xLdW3NpVl7z8vFHdva6bi3BVqE8pJ0Pi+eVE04oHgcm
	wGic2b9I4vHmVl5Kle7OtmFDJyl1nvN35AJrm/vvc+74wGvN0u7wc9u0v0DBo7N5hA0c=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uuZKA-0006ov-6I
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 05 Sep 2025 16:30:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1uuZK8-0006oo-E8
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 05 Sep 2025 16:30:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=38RoV3MRt21m9VCpn2yaWDX6X26/U5hWGaVRdsOFlqo=; b=iVDbPyXAE7vtC+iCnpqb8bwxJ5
 BrmDVAIBv2DMFP/tPxorC7igC1tUfRiGYGig5no/8KB2IkSDlBgcbvw8+jAsKAWAjO91I38QWS7ns
 ZiT14EfQZh7dUWF9LRzNEwvLeRm7DnaA12I37gZmszlQiXRtAdsPGRDHYL6KpFRAYMsk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=38RoV3MRt21m9VCpn2yaWDX6X26/U5hWGaVRdsOFlqo=; b=YKUycKHCfoCETYpZ0Rg6jSEpp0
 uyiHBwqzVvf3Xj/ZoPgLra12Se8AaG+TAvyxWeIQ65V9OLHb2c57Z6GH/DFFyFu3WJ+smuM4XFk8Z
 zad3tvEf0g3sAApwmItnQfxm8woF8vYcFyyTeJWm5tqlYF4kxoJQQnDYREsd+Nb7mzaE=;
Received: from mail-ed1-f51.google.com ([209.85.208.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uuZK8-0003ep-14 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 05 Sep 2025 16:30:04 +0000
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-61cc281171cso4282229a12.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 05 Sep 2025 09:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1757089792; x=1757694592; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=38RoV3MRt21m9VCpn2yaWDX6X26/U5hWGaVRdsOFlqo=;
 b=BHaPdf2Ut2v18L7LaMyzrv3UtUcNZN+FuJqhT4Cs7pDBCOMph3jjP2LlvtKTjYT6NO
 tXjumfEiJvQGjzcDoY4qIiQ8g6+ZEAGC327CRREzuS+M69qSaGU7WUYmj21oCoEqJI5K
 CDbkuVjyNu1agGMoLHZFxvNvnevCNs8F/3MRwvXkiap/Gb+IInXpdBKjihSl2ZZpkrKw
 0nURwLr31f4F0k758NrvCPH2QfodQT6I1GeDSMvGk+mxjDLP3yKqzWCHmlsdljukN8LS
 BXVRwE7XjHarIW3N+vbHur9G45soVNxFT1JwGUzulFuRqii7XbcPP71pSAwUlgFQB+6I
 eITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757089792; x=1757694592;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=38RoV3MRt21m9VCpn2yaWDX6X26/U5hWGaVRdsOFlqo=;
 b=ByNJ6Ea/KjF4jC1EiAcUcD9YawSauIVhDPPBcTs6ERv1DmTBH5NrVsLVIeqQCrpJHW
 TGM2UTwKjJH7EBbOsn2/iueFpzFnuuvY75Dz7QSct5gZ/9HU3jvFcGjgR3D6RA8JGdTl
 Bl/iFYgWqmDc/gMNDeISm8g2qGAKynKwE7zAqgKodvnkbteMohPALJ/Z38vFyw4htRh5
 DOUNQAAOyeGt9Ys7OVMnD7uXXNO0Ew6IcBtVO782s1WdzSFUKeMSJxfVSklmAeITd7Do
 1hRbomLrfIXy+HPPSOQxPwrgZzHYinQSmeRq0MCA4bMGbvaYHJKQfQhgBpM0ofKH9WlI
 0Sqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUjB40DhzPz6HsrxHbLbKTZexY2WFaHc2yB7xyTPT1AR+LELNnuUkSP5buBVoTti60VIaCWdpZMLGF5mkigQ==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy0UsCDf+LcPKh9jhC8ewHRijSaWgHs+0HyPy5RXGnADbH7ts3s
 rCAGShLP1CIPs0talD4AnAJE2Q6/lu8IHO4hQD7FhA/XrYRvXLPVuSt0bNSle1fNNj2h208KfyR
 Bz2PF56s=
X-Gm-Gg: ASbGnct+4Bp4n6n7GHVx6tvVYCJSsr68fM5dhKREpsxALZ9b2mzkt/hUCl31uHKxatA
 8V8iFyCOJ8ywgOTBrVVwfCqwcBjA4stoSJ3QGuCE3ehbJ294vtuMhAPQwsuFQQhu68C2Xtr6fI1
 BpYKnirTjAbI7wnL0r2yQ4eyLZ2cmwxBEvUQWf7djHxeR5M1lsh661Nq2EVzkY7xXkOvw0k3hHq
 zaTiYCSOZ4STNu0aQEXwaceGoDgn55KP9maUxtOcv0V1FFQJjYaxY053Yomzn9Z/pTQTCHR/1rd
 Hl0FoQS21gtrQ9jnmL6JetxU+4pjq5x21FNCrp/V8+MGpDSpYQXWVzMF6S58sKegDVmQlZm6r6B
 LhegduhQUGRHMC+8JUv5rLYXDsA==
X-Google-Smtp-Source: AGHT+IEbX7TLmTaMwpShKtCjVerZWqrr/UBxB0YUnBbh+NMFi75E+MxyttToNGmKdJlXe36bbMityw==
X-Received: by 2002:a17:907:97d6:b0:b04:6858:13ce with SMTP id
 a640c23a62f3a-b0468583507mr1159761666b.38.1757089289588; 
 Fri, 05 Sep 2025 09:21:29 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0410a65a68sm1475036366b.110.2025.09.05.09.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 09:21:29 -0700 (PDT)
Date: Fri, 5 Sep 2025 18:21:27 +0200
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aLsOBwV6CVBwG9JV@pathway.suse.cz>
References: <20250902-nbcon-kgdboc-v3-0-cd30a8106f1c@suse.com>
 <20250902-nbcon-kgdboc-v3-2-cd30a8106f1c@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250902-nbcon-kgdboc-v3-2-cd30a8106f1c@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue 2025-09-02 15:33:53, Marcos Paulo de Souza wrote: >
 These helpers will be used when calling console->write_atomic on > KDB code
 in the next patch. It's basically the same implementaion > as nbc [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.51 listed in wl.mailspike.net]
X-Headers-End: 1uuZK8-0003ep-14
Subject: Re: [Kgdb-bugreport] [PATCH v3 2/4] printk: nbcon: Introduce KDB
 helpers
X-BeenThere: kgdb-bugreport@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: kgdb bugs suggestions <kgdb-bugreport.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
From: Petr Mladek via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Thompson <danielt@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue 2025-09-02 15:33:53, Marcos Paulo de Souza wrote:
> These helpers will be used when calling console->write_atomic on
> KDB code in the next patch. It's basically the same implementaion
> as nbcon_device_try_acquire, but using NBCON_PORIO_EMERGENCY when
> acquiring the context.
> 
> For release we need to flush the console, since some messages could be
> added before the context was acquired, as KDB emits the messages using
> con->{write,write_atomic} instead of storing them on the ring buffer.

I am a bit confused by the last paragraph. It is a very long sentence.

Sigh, I wanted to propose a simple and clear alternative. But I ended
in a rabbit hole and with a rather complex text:

<proposal>
The atomic flush in the release function is questionable. vkdb_printf()
is primary called only when other CPUs are quiescent in kdb_main_loop()
and do not call the classic printk(). But, for example, the
write_atomic() callback might print debug messages. Or there is
one kdb_printf() called in kgdb_panic() before other CPUs are
quiescent. So the flush might be useful. Especially, when
the kdb code fails to quiescent the CPUs and returns early.

Let's keep it simple and just call __nbcon_atomic_flush_pending_con().
It uses write_atomic() callback which is used by the locked kdb code
anyway.

The legacy loop (console_trylock()/console_unlock()) is not
usable in kdb context.

It might make sense to trigger the flush via the printk kthread.
But it would not work in panic() where is the only known kdb_printf()
called when other CPUs are not quiescent. So, it does not look
worth it.
</proposal>

What do you think?

My opinion:

Honestly, I think that the flush is not much important because
it will most offten have nothing to do.

I am just not sure whether it is better to have it there
or avoid it. It might be better to remove it after all.
And just document the decision.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
