Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9DCAD6F8A
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 12 Jun 2025 13:53:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PThjt4+uGcRdUvusnGXbBF2pCdLLzGLFxHNpFDQHRWc=; b=V11KWrqkrCl3NfEC2D2cqqwE0k
	SZwYbDa3SfDDnKZjg/EbPFwcaw33Khzu4FbGcjT7l63CubVeuCh8xLZ8heWLKenWg8vsG3qxoVTyP
	WZRcDylZZkk97FnSHGBNLDVTvKxGg4JhfH/Po63WD+sjHivHZCmf05JDihkg4TWAeouw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uPgUa-0003f2-1k
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 12 Jun 2025 11:53:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1uPgUX-0003eh-PK
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 12 Jun 2025 11:53:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VpdeBAczxDpMxHPi8ej3bXu0PaquJ+drDxjVDx3klZk=; b=Vh88BtCmPhybMLgfVho4sc7SUB
 oRlLXjOvqa0IJ+xVRcnbAURlMq7nyYVPJRcKBh8FwvlmiiQaYnHfBHShfJfJfu8vj5grZaGiKG8bT
 QSeEgdAVJz4CBe7Lz1FCxUHlYqnMVCSSCmYWv1ln7qvPYC3+P/1VWuhfTVkMyEuxGi/0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VpdeBAczxDpMxHPi8ej3bXu0PaquJ+drDxjVDx3klZk=; b=hkro3mYPmmCXC/fqL7tLsAu9Cj
 decswKrsyAm9jR1MCWb6wPsXWSzHxXtjFNQShtlt9bQNWBxb2bly3AqcR/JyPue6JtRqNmv66FNJo
 gHaryJDA0A5o7Ol9wct4CHbmofpnKf0/MprDNzr6kU5wuKC//eyqtsbZMs8PlqE4E9ss=;
Received: from mail-ej1-f54.google.com ([209.85.218.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uPgUX-0002jy-Ci for kgdb-bugreport@lists.sourceforge.net;
 Thu, 12 Jun 2025 11:53:09 +0000
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-addfe17ec0bso388854766b.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 12 Jun 2025 04:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1749729178; x=1750333978; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VpdeBAczxDpMxHPi8ej3bXu0PaquJ+drDxjVDx3klZk=;
 b=EfhhecSrpYH1lPxG6RkecEXe/tgoGxcrAYhNJgfxpPVm5uqMkWV4g0T3KejnREBCcL
 BjjJNZjy0+wjxKW3OnLYF2CnLUWLCneEktrNeghBsHYSYzkVfsGUUILO5penK2I2IDDR
 PfJxHz6vKdz5HqiXUxusSYdH5ujFr01GSlDGw7EQYw+Vy7vr2wJvw62NCtY6ms1JPFCv
 +NL7GpVBvi/eu3z8UX0qr9i/VHCJgLONSJFV4CdOutYNC4d89DLEsvM/s0bvulDlLd+8
 KAa/Vq1i8kicssGE9XTiAzQe1Q/Obz64eGN7z0rydpm13o9jofYZX+LA9DwrPnTYQ/4p
 xcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749729178; x=1750333978;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VpdeBAczxDpMxHPi8ej3bXu0PaquJ+drDxjVDx3klZk=;
 b=CYNMEqqCtReAIy9eJvAFPT2mIKAdUwNmk4tp8d1q/OyoaHsJBExSfCA/4xld8vonhq
 QUdI0jqyV912wuzkzEsvny0uUw1wdgSMH9744aDZXVx1uLDD0cIzbU7m3khzMfAxMZ0c
 vownpJb+IGbeb66wIgBO0EuM1wdnNkJMjwMEcP9flp30X09nLUquCqM4YLW6KcVV9DFJ
 g+RlQJHaDvsA8SdSJuJyMrDI5Ob5d99GQz4LBKtYKbwuN8Iet+4RhdanlIb7R0wsfyK8
 ovwOcJQJU6kpgoVkssB1x8wU4vbh/aUcjfmMYa5sZua9yYl8jteUp3eTyrnNPPvsmxBX
 bGhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfahgdgHrO7/wHmleQLZUzeUWjp27P8NhgsKg6JzM1ai6Y9q0Rxug1901TQVA4Xg7W5SsUbVFbFv0hoYcmSg==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwS3/hOfyRJypzvXGbV7mMSvfgsavmsfh2YotGQKVvu3kepfnnT
 m8AYWv7SigwlxKbz5puZt65JmSgr2KukGfME4t4Y0rnN41fvVEbazUaoiHeQfApHqoFxBCjotTi
 9HSgl
X-Gm-Gg: ASbGncuCnSpfT6GfhGuMWUvouV9DfOOxeC3iqAtSTj65FeU1La46Vm5T4/MrUuRUe4A
 C5u1QZJxs+C35I5eF3MgRFjfT+mbHm6bpkJST2Qp2RA0BBnHAwic7yH3vHAcHveQmx24eDKs1yb
 nt6wXwOi5ByMQKLX/eDL/Illf9Um9FRcfqQB+cKMbmA2aEIlrhhtvpIIPmiXBt2Kv2KYvge7wsj
 I6wu/4GRXxylZR6LT5Bp9GSLGDq26uwXJynRRNnhFq9WcLVgUyMmMAwV4+1dWwRk51T2gNa5wGK
 y4Y2/MNDDRRFWrA20Mr9hWN6cy7ThPLa/NyYKaNID7yDWRMY9ya5FuuToyK30Lj1wPeZrKvYTLk
 =
X-Google-Smtp-Source: AGHT+IF/248Rvx3CVC08UaAQ4P3dTeJa+QHLA+I/CORpcgGm1jvrTGpa+IJI7ILEeBXIza4gfGGQkg==
X-Received: by 2002:a05:6000:288e:b0:3a5:271e:c684 with SMTP id
 ffacd0b85a97d-3a560814897mr2780693f8f.24.1749728784595; 
 Thu, 12 Jun 2025 04:46:24 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-313c19dcd05sm1406413a91.14.2025.06.12.04.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 04:46:23 -0700 (PDT)
Date: Thu, 12 Jun 2025 13:46:06 +0200
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aEq9_kOoLSQwuYBq@pathway.suse.cz>
References: <20250606-printk-cleanup-part2-v1-0-f427c743dda0@suse.com>
 <20250606-printk-cleanup-part2-v1-1-f427c743dda0@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250606-printk-cleanup-part2-v1-1-f427c743dda0@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2025-06-06 23:53:43, Marcos Paulo de Souza wrote: >
 Since commit 9e70a5e109a4 ("printk: Add per-console suspended state") the
 > CON_SUSPENDED flag was introced, and this flag was being checked [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.54 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uPgUX-0002jy-Ci
Subject: Re: [Kgdb-bugreport] [PATCH 1/7] printk: Make console_{suspend,
 resume} handle CON_SUSPENDED
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
Cc: Richard Weinberger <richard@nod.at>,
 John Ogness <john.ogness@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Thompson <danielt@kernel.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net,
 Johannes Berg <johannes@sipsolutions.net>, Jiri Slaby <jirislaby@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri 2025-06-06 23:53:43, Marcos Paulo de Souza wrote:
> Since commit 9e70a5e109a4 ("printk: Add per-console suspended state") the
> CON_SUSPENDED flag was introced, and this flag was being checked on
> console_is_usable function, which returns false if the console is suspended.
> 
> No functional changes.

I double checked potential functional changes. In particular, I
checked where the CON_ENABLED and CON_SUSPENDED flags were used.

Both flags seems to have the same effect in most situations,
for example, in console_is_usable() or console_unblank().

But there seems to be two exceptions: kdb_msg_write() and
show_cons_active(). These two functions check only
the CON_ENABLED flag. And they think that the console is
usable when the flag is set.

The change in this patch would change the behavior of the two
functions during suspend. It is later fixed by the 3rd and 4th
patch. But it might cause regressions during bisections.

It is probably not a big deal because the system is not much
usable during the suspend anyway. But still, I would feel more
comfortable if we prevented the "temporary" regression.

I see two possibilities:

   1. Merge the 3rd and 4th patch into this one. It would change
      the semantic in a single patch.

   2. First update kdb_msg_write() and show_cons_active()
      to check both CON_ENABLE and CON_SUSPENDED flags.

The 1st solution probably makes more sense because we are going
to remove the CON_ENABLE flag in the end. And even the merged
patch is small enough.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
