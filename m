Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 55922D1D11F
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 14 Jan 2026 09:20:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2coMh0PXX6Kd5ofSfkt/ZO2xl8CjspTPS6mTktoJpvA=; b=E4K3m1AURmgmBt+UT9/UbLHD8d
	L8/m+eZxRWC00FdjIDmUh37Y8nXQ7K9+UPHYbc3hHRZGZec7e9VzHMdEzKljUF7NflMflJXeTnj2k
	r35FRTvBHoVH7/PojgY67qB1gynPcx7NSGjqRf/+JJlnpTuIqmVfk/jEKxhhJPdA+7us=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1vfw7J-0000TZ-9g
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 14 Jan 2026 08:20:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1vfw7H-0000TI-JG
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 14 Jan 2026 08:20:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kOjWICKElajAktcnLTxDO0a0hjOrXuTPJG+TIiIDMlE=; b=TWi3vue8kS4nyMxkmVme+V14VM
 C4MAwAGBc2fqBRtu5OPWGJ1jiwDBEw0fAmIqfnOWcaxly37fCK0cmMcNont5GkSgCj12ZIl0qb3j7
 KjuJB6F7syHhaEXM0gkb5uCAutn2/LKFBa2sEWlmdkvLg3XB6poTnF3okizWWMamW2Ns=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kOjWICKElajAktcnLTxDO0a0hjOrXuTPJG+TIiIDMlE=; b=BXTSQ9EfZqEtnDH8k8t2ss6ghH
 XkBhFVGS7XnSKVrkrqaLQXD89yg8/ExAtdFk5JpZ3lT0LZUZioUFFzff+ID0gpGUqjYXwRiJ1NTuZ
 cQ8+JY2otvCVcXvQ/2wb0wh5oBpvxw0G87ZfrJqQAvB8V2BlJgAW1cSk9QGgPrbivw+M=;
Received: from mail-wr1-f49.google.com ([209.85.221.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vfw7H-0005wf-QN for kgdb-bugreport@lists.sourceforge.net;
 Wed, 14 Jan 2026 08:20:36 +0000
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-4327555464cso5005558f8f.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 14 Jan 2026 00:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768378824; x=1768983624; darn=lists.sourceforge.net; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kOjWICKElajAktcnLTxDO0a0hjOrXuTPJG+TIiIDMlE=;
 b=GnTUaOgkvrPDc3Tqf4/6y+MHA7k1IfPzoGiXwFRoFJ3R/7flT1Fkl1z0vuzLUdd9QN
 fqaSRu79oRLNgpOJGDZsREzpqPVB/dTvy2swJbtajeaYia25knUmWEc5obFgL2CpK0yZ
 JHqsqW3Xy5qBfnzeJasug5puJVRnU1wGqHNsrmto43szKNeqo+gVRABhbtHxQh4sJ920
 quKacdk2OHYgWjIfbAs9IWgttw9cCQNtNRm9MThQ9yxvEz7SIum2I/9SU+YnhXDOZNPr
 5UEOLGXJE36L9cmySWFHwKSbDsCMRdvkjReSkoqTu2oYHj9oY1PL4Ag7YAMg7AK5CPAJ
 y1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768378824; x=1768983624;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kOjWICKElajAktcnLTxDO0a0hjOrXuTPJG+TIiIDMlE=;
 b=aPVO1CzIdrYD/QA0kBnqPabtfbBRguMWz5WIOQYeFBRhK0ivjjN3fZyqUP9B7VWoZf
 p+iQygAkm4Rr7rK2PB+sDQqLfNuWwqzBzgYJlIh0SREsIihFcg6xqAN9C3KVA2gezymE
 gfQN5U2QRV9Q/WWSJhpeZQzj6og6lFaMGLtziVAY4JRX4b6lf6NZlz3314p4XUvTVqux
 mCKEb+Cf0vY23A1Sgq6M989nYq9ERdP6SeVxx30ekU/ed5dGaLaDR47Cqr78RZDWOmaS
 t5WXRHGdH7PnYjL5JolaxOHmX86xFz1F//d/WCHtCKzQ45YyffLDdLt1fJmHEFtsY+0U
 OA3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQkJcgeDborGCsBTa6n5Q4IrqHzvoeKu+URUj6kNRvI84T4hvTz49Z0Tw2x9w+CUMIO+9G5bVykUmb1h5QrQ==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx0ujUROrIOBofk05tOa0QWls+dzAkCwA3AB2t7lVXMWedkl3FJ
 fkiwtLrCq4xaV05XJYSRodpZbPFAX7tY877l2nK8I42+ouq1K+Y2HT1icv5UxIpvdVY=
X-Gm-Gg: AY/fxX7ciMDViL2HTY3ERRT5ORC0DdtAA9AIiO6RXMu3MdWqgVxPJz3F9/S2F1ccTuA
 g3aTPogj0QUrUPaIee2nc6DMLfG88dvibNKgFPWB8HQtjNkPewT/AVXs7fVlrFuYRfxvq2iM99D
 atzWTfyCNgcXECBw7SOpwmZSQ2yUZI9Rg6uSh27xaAJiueMa5l0vIICGvauTse8TC9yF2JsQa41
 00CFQrbX8yNTg4yqVboeGwrI3A6jjRp51ztuF+q+hrlPrdUn5tXO16P7iMCxWoj9F7pqGcnY/54
 2bEPOYYzmGrwYHC0LnHxB0wL2KAUZ7UzuaQGT9QEg8jFdC4R6fISqsx6O6dts+zEWzT8qUDBAYl
 xaRx7vw0zPveiEEk4UvuJ5SEC8MJEJJz0Jt2nTX5glN390d0DEz4OpfkMABxDwP3oDeaxjf/JWs
 /vxt4onrkMtPrSOA==
X-Received: by 2002:a05:6000:40e1:b0:432:5b81:498 with SMTP id
 ffacd0b85a97d-4342c4f4a32mr1782744f8f.23.1768378823922; 
 Wed, 14 Jan 2026 00:20:23 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0dad8bsm49346913f8f.8.2026.01.14.00.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 00:20:23 -0800 (PST)
Date: Wed, 14 Jan 2026 09:20:20 +0100
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aWdRxBbJOEIZ-KjE@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <aVuz_hpbrk8oSCVC@aspen.lan> <aVvF2hivCm0vIlfE@aspen.lan>
 <a5d83903fe2d2c2eb21de1527007913ff00847c5.camel@suse.com>
 <89409a0f48e6998ff6dd2245691b9954f0e1e435.camel@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <89409a0f48e6998ff6dd2245691b9954f0e1e435.camel@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue 2026-01-13 21:32:33, Marcos Paulo de Souza wrote: >
 On Tue, 2026-01-13 at 09:41 -0300, Marcos Paulo de Souza wrote: > > On Mon,
 2026-01-05 at 14:08 +0000, Daniel Thompson wrote: > > > On Mon, J [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [209.85.221.49 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.49 listed in wl.mailspike.net]
X-Headers-End: 1vfw7H-0005wf-QN
Subject: Re: [Kgdb-bugreport] [PATCH 00/19] printk cleanup - part 3
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
Cc: Andreas Larsson <andreas@gaisler.com>, Kees Cook <kees@kernel.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel@riscstar.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Breno Leitao <leitao@debian.org>,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, sparclinux@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Richard Weinberger <richard@nod.at>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-serial@vger.kernel.org,
 Daniel Thompson <danielt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jacky Huang <ychuang3@nuvoton.com>, John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, linux-m68k@lists.linux-m68k.org,
 Nicholas Piggin <npiggin@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>, linux-fsdevel@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue 2026-01-13 21:32:33, Marcos Paulo de Souza wrote:
> On Tue, 2026-01-13 at 09:41 -0300, Marcos Paulo de Souza wrote:
> > On Mon, 2026-01-05 at 14:08 +0000, Daniel Thompson wrote:
> > > On Mon, Jan 05, 2026 at 12:52:14PM +0000, Daniel Thompson wrote:
> > > > Hi Marcos
> > > > =

> > > > On Sat, Dec 27, 2025 at 09:16:07AM -0300, Marcos Paulo de Souza
> > > > wrote:
> > > > > The parts 1 and 2 can be found here [1] and here[2].
> > > > > =

> > > > > The changes proposed in this part 3 are mostly to clarify the
> > > > > usage of
> > > > > the interfaces for NBCON, and use the printk helpers more
> > > > > broadly.
> > > > > Besides it, it also introduces a new way to register consoles
> > > > > and drop thes the CON_ENABLED flag. It seems too much, but in
> > > > > reality
> > > > > the changes are not complex, and as the title says, it's
> > > > > basically a
> > > > > cleanup without changing the functional changes.
> > > > =

> > > > I ran this patchset through the kgdb test suite and I'm afraid it
> > > > is
> > > > reporting functional changes.
> > > > =

> > > > Specifically the earlycon support for kdb has regressed (FWIW the
> > > > problem bisects down to the final patch in the series where
> > > > CON_ENABLED
> > > > is removed).
> > > > =

> > > > Reproduction on x86-64 KVM outside of the test suite should be
> > > > easy:
> > > > =

> > > > =A0=A0=A0 make defconfig
> > > > =A0=A0=A0 scripts/config \
> > > > =A0=A0=A0=A0=A0=A0=A0 --enable DEBUG_INFO \
> > > > 	--enable DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT \
> > > > 	--enable DEBUG_FS \
> > > > 	--enable KALLSYMS_ALL \
> > > > 	--enable MAGIC_SYSRQ \
> > > > 	--enable KGDB \
> > > > 	--enable KGDB_TESTS \
> > > > 	--enable KGDB_KDB \
> > > > 	--enable KDB_KEYBOARD \
> > > > 	--enable LKDTM \
> > > > 	--enable SECURITY_LOCKDOWN_LSM
> > > > =A0=A0=A0 make olddefconfig
> > > > =A0=A0=A0 make -j$(nproc)
> > > > =A0=A0=A0 qemu-system-x86_64 \
> > > > =A0=A0=A0=A0=A0=A0=A0 -m 1G -smp 2 -nographic \
> > > > 	-kernel arch/x86/boot/bzImage \
> > > > 	-append "console=3DttyS0,115200 kgdboc=3DttyS0
> > > > earlycon=3Duart8250,io,0x3f8 kgdboc_earlycon kgdbwait"
> > > =

> > > Actually I realized there was a simpler reproduction (hinted at by
> > > the
> > > missing "printk: legacy bootconsole [uart8250] enabled" in the
> > > regressed
> > > case). It looks like the earlycon simply doesn't work and that
> > > means
> > > the
> > > reproduction doesn't require anything related to kgdb at all.
> > > Simply:
> > > =

> > > =A0=A0=A0 make defconfig
> > > =A0=A0=A0 make -j$(nproc)
> > > =A0=A0=A0 qemu-system-x86_64 -m 1G -smp 2 -nographic -kernel
> > > arch/x86/boot/bzImage \
> > > =A0=A0=A0=A0=A0=A0=A0 -append "earlycon=3Duart8250,io,0x3f8"
> > > =

> > > With the part 3 patchset applied I get no output from the earlycon
> > > (without the patch set I get the early boot messages which, as
> > > expected,
> > > stop when tty0 comes up).
> > =

> > Hi Daniel, sorry for the late reply! Lots of things to check lately
> > :)
> > =

> > Ok, I reproduced here, thanks a lot for testing kgdboc, it's a quick
> > way to check that the new register_console_force is not working. Let
> > me
> > take a look to find what's wrong. Thanks a lot for finding this
> > issue!
> =

> Ok, I did a bisect and found out that the issue lies in the last
> commit, where CON_ENABLED was removed. After it, I then checked what
> was wrong, since everything was being plumbed correctly (tm), and then
> I found that it was not:
> =

> On _register_console, the function try_enable_default_console is called
> when there are not registered consoles, and then it sets CON_ENABLED
> for the console. Later on, try_enable_preferred_console it checks if
> the console was specified by the user, and at the same time it had
> CON_ENABLED set.
> =

> It worked by chance, but now, we don't have this flag anymore, and then
> we are not _marking_ the console on try_enable_default_console so
> try_enable_preferred_console returns ENOENT.

Great catch! Yeah, it worked just by chance.

> So, without any console kgdb is activated much later in the boot
> process, as you found it.
> =

> I talked with Petr Mladek and it would need to rework the way that we
> register a console, and he's already working on it.

Yes, I have some patches in early stages of developnent of another
feature which would help here.

> For now I believe
> that we could take a look in all the patches besides the last one that
> currently breaks the earlycon with kgdb and maybe other usecases.

I agree. I am going to review this patchset first. Then I'll try to
clean up the patches which remove the ugly side effect from
try_enable_preferred_console(). Then we could discuss how
to move forward. It might make sense to push this patchset
first without the last patch...

> Sorry for not catching this issue before. I'll use kgdb next time to
> make sure that it keeps working :)

Do not worry at all. It was a well hidden catch. It is great that
Daniel found the regression in time...

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
