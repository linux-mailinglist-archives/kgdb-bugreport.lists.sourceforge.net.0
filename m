Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 122A5C91FE4
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 28 Nov 2025 13:31:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zv2uKQp9PfhEgO/vkGacycrfuKJKD7vCgLo3ltzttuI=; b=Wi4hvmw6Wc6RuVQ/mlchlBxT1/
	RF/Ofhbavz+T/FZYvzOd/R7FySj4Qzeux0TZ7j7sVM0G9UgtIb0wMYqSa/fPP3Tx4L+MOu9fBUkg9
	+5xgsO5g2f2ILLQRuH3N+V0/3ywNusE2WHPrPaCP8WTjcosUaSs/hmfZmrWKXgwP/hew=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1vOxd7-0001OL-Pu
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 28 Nov 2025 12:31:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1vOxd7-0001OF-5N
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 28 Nov 2025 12:31:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pcb229vvLyBxSU063HYeCn4lxqy1srWBTS640feRync=; b=MbShAFQ96Q25VPmvyl69M/Qm6Y
 +BQ9YAljpR3jN/UAdu4qY6v4vJ3c2M0vqtVeF2MaQt9vYMgHuBobZ1WQmlGlAooNINY6BWLT7W0gY
 4/GahGZEE9nmBKYvWwXSlTcBWpU8qAEnEeqJGSYvOKA52+W0/1JE0c7qx9SirqQj31BM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pcb229vvLyBxSU063HYeCn4lxqy1srWBTS640feRync=; b=MswST9Z1MnpFT2ltb1PHAwxqiP
 fiTGN7nxBRsETr8l5IxIDlJi4QoZEX9dDJz5kOIXFsAqyAh3fyN3zGBbIu1eJtc3ZQO7Yga9NRLrw
 /2NYRw1BId9EQmZNiNYkTm8yBnc1XyTnDveEhoYaWEySibQ9MKZW5cpW80DXUjDkZZ2A=;
Received: from mail-wm1-f42.google.com ([209.85.128.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vOxd6-00009X-GJ for kgdb-bugreport@lists.sourceforge.net;
 Fri, 28 Nov 2025 12:31:17 +0000
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4775ae77516so18985255e9.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 28 Nov 2025 04:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1764333065; x=1764937865; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pcb229vvLyBxSU063HYeCn4lxqy1srWBTS640feRync=;
 b=FK/kIAqYFL3NlMxm/V1ugPqGaqVYWqT/BtrwMl4zCewQg9LdL8LSe1gkQpa0RLtZ6Y
 rq8DoHBsb5bUtxS2yxy+H11GXipHCvHK6sid1iiZiuohbrlK4D3ye3ltqpaD3a85k8ge
 Z3uZNFq4VDsBlbtcYmNgS/U4OELDy2rScACbFrAFgEZ75a15/eUGDgTA2uJ4LVMiesMQ
 FemuXaOgrrWipplKzgX8jjmlj/tJVFYEbLVJCu3jZcODUeoVvglqpwYY7HXDlC03ZVD9
 ONtf7paa1/gTyERKpC4+OlRxgu7XFLhSCzPlGSe5zMtEh0U2lYfosbEd9997IPRZkVnN
 ecVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764333065; x=1764937865;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pcb229vvLyBxSU063HYeCn4lxqy1srWBTS640feRync=;
 b=jpH/m/onNXkWBjPhEKFdVVeXHL0KsB4kuUVD/ufj761dWUT68g3/jnhnXB6EeBZ3g5
 9gG//MmTSZ/OSgGbfTg8CrnbPM25ZZtmdi41TpsvwzheSBdlJKLqt2WuwV7g35AzkGBI
 /RIlZIAt20geJLbJUPZlF/iXSCciFVaKEdunL5yOFaD/NQXZXz2RrAPSVEYHXYVxv4/P
 TAl10ATjsJjqX8IVZaaMQNcfdLg10F+srG+5xzwjx5Af4KfGTuYZaW4EfmvDk8vPKRVO
 43ncI9fB2+hL7lOWeE6MEM4YnP2ghZAOKmFcDsqyumBLTsR03QgmcvBFbr+qBp7AOUBG
 XNRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFi1n8zTSu2FP4tgQ57Owt0cdCski18EBWaZG5qcX8OiVLe3vDdmvCLbsJDTKvxOmz+naeu3mg+pdU2SWdsw==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yyw5SrDW1KleZJI1VKPVO8sX0vWs8/lYQVJgRcn++AeGGfdYGAO
 237pJPVixK1/xIr1vNZpPwgIt11jxUsRWlSa2Zi9F8p5tNgVvlBxVC9g8/CQlIdXvdE=
X-Gm-Gg: ASbGncvHRgyii2zjxGDfPX/kgkI9wfd7ue9COv+sVpAuRa+/xITRtRtm07zieymjMK3
 91b0LbRb03F4lrmHLURPFV+denRFgb+ng4tfgaRG2PH0itPXSVvypDFp+gOEJ3KhHNGPIRHM+g+
 QlLSy4ABAAvjB1ZzTLmCYXClfXDILC441lv1iv3TiQqLrOFW0Tpta5Czeej4AEgBP4AnRMjHPLJ
 +ak26dJJssH/8VR9r7w1YUfo3VLhzwrBqUtVX6c/zSvey635hNoqFZB81iGv2r9ZnDpDW0YPaAE
 IdCZaVS6FIqpSCGe3BgI0a6P4NJAfneNCH45x7njlCd2AcHcBK5/U6GZberJFHI5+E+QNHaQC7a
 3tjQJ69P1ANJroHvkfKVr3/TDmAncmglIPAlDumJX7C4ptO1ukxy1SN6Km+j7hUCTY/FZ/Hjdm0
 P2TPp03hHHUjl3wg==
X-Google-Smtp-Source: AGHT+IHRcq2FJ5WThogfhlAWqk7vaz8fGAovTB+lQ9cVsK0w612w7DjIt7QhCUcTVHzHz5dbtHK8GA==
X-Received: by 2002:a05:600c:450f:b0:46e:1abc:1811 with SMTP id
 5b1f17b1804b1-477c1124ecfmr270011685e9.27.1764333064798; 
 Fri, 28 Nov 2025 04:31:04 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1ca1a3e4sm9837124f8f.25.2025.11.28.04.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Nov 2025 04:31:04 -0800 (PST)
Date: Fri, 28 Nov 2025 13:31:01 +0100
To: Daniel Thompson <daniel@riscstar.com>
Message-ID: <aSmWBYRmH_BNM4kg@pathway.suse.cz>
References: <20251121-printk-cleanup-part2-v2-0-57b8b78647f4@suse.com>
 <aShr0DZRmpDnL0nz@pathway.suse.cz> <aSlw2AHo_AWzjH-s@aspen.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aSlw2AHo_AWzjH-s@aspen.lan>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2025-11-28 09:52:24, Daniel Thompson wrote: > On Thu, 
 Nov 27, 2025 at 04:18:40PM +0100, Petr Mladek wrote: > > On Fri 2025-11-21
 15:50:32, Marcos Paulo de Souza wrote: > > > The first part can [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.42 listed in wl.mailspike.net]
X-Headers-End: 1vOxd6-00009X-GJ
Subject: Re: [Kgdb-bugreport] [PATCH v2 0/4] printk cleanup - part 2
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
 Marcos Paulo de Souza <mpdesouza@suse.com>,
 Jason Wessel <jason.wessel@windriver.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Thompson <danielt@kernel.org>, linux-serial@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Johannes Berg <johannes@sipsolutions.net>, Jiri Slaby <jirislaby@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri 2025-11-28 09:52:24, Daniel Thompson wrote:
> On Thu, Nov 27, 2025 at 04:18:40PM +0100, Petr Mladek wrote:
> > On Fri 2025-11-21 15:50:32, Marcos Paulo de Souza wrote:
> > > The first part can be found here[1]. The proposed changes do not
> > > change the functionality of printk, but were suggestions made by
> > > Petr Mladek. I already have more patches for a part 3 ,but I would like
> > > to see these ones merged first.
> > >
> > > I did the testing with VMs, checking suspend and resume cycles, and it worked
> > > as expected.
> > >
> > > Thanks for reviewing!
> >
> > > Marcos Paulo de Souza (4):
> > >       drivers: serial: kgdboc: Drop checks for CON_ENABLED and CON_BOOT
> > >       arch: um: kmsg_dump: Use console_is_usable
> > >       printk: Use console_is_usable on console_unblank
> >
> > These three patches were simple, straightforward, and ready for linux
> > next.
> >
> > I have comitted them into printk/linux.git, branch rework/nbcon-in-kdb.
> > I am going to push them for 6.19.
> 
> I pointed the kgdb test suite at this branch (as I did for the earlier
> part of the patchset, although I think I forgot to post about it).
> 
> The console coverage is fairly modest (I think just 8250 and PL011
> drivers, with and without earlycon) and the suite exercises features
> rather than crash resilience. Nevertheless and FWIW, the tests didn't
> pick up any regressions. Yay!

Great news! Thanks a lot for doing the test and sharing results.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
