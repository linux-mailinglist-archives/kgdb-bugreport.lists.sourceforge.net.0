Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC93D1EFF9
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 14 Jan 2026 14:12:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iidqws4DydzZkK16JOzOeWeWITrFkhFgOtS/1IyNtjI=; b=NjKTbTKGIIkD1FWkpdqcUAaQPC
	kIyD/afnhiYQLixmy0CAK5LQ1p/IZw2t3fxQnDTASnkhzHum8+wR+fqeVu6/28TWwCgLOtzlS/x6L
	eRwDG3AsOKpN0KdChwhhXT6hnP0eXSJ10TMejzNNQTFe0JDlC3PhYT9foebhWoHiFfw4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1vg0fs-0006up-D3
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 14 Jan 2026 13:12:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1vg0fq-0006ui-Rk
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 14 Jan 2026 13:12:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ucpTGToIn8N6Wm60fm7MZ05SRRlKYptl+ek5X25PfwQ=; b=J7jZzL2/umkTPYknc1EIgkwXxj
 2i3H9tzwFrWBP2E+uh+g31KeE5IxfvXilSjM4BVgvknEaVped/r25bWPkDrCC8cQH4TwfqLK9ajkr
 4p54wGx1gMJ5dTosQK87lK+D3dTJjgmiav9gnizXFr3WzUnpggU7U9+xfBmoZWuykHWM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ucpTGToIn8N6Wm60fm7MZ05SRRlKYptl+ek5X25PfwQ=; b=F4VF+UUsQhq9MA2KscoHNcpXGR
 C1IW7JriIsmjmQq0inJysDsKS0KC2cWgbW8Ab2VB6g+ZgpbLgz91c+68GJeImob1wNpLaKHpDMOr3
 m2n+T2BoGcraZQ9t3GJj8wPOjFG50CmsuGTSNXM8dxNw3fF+Rs5z3C3zSdxELMa0TYGE=;
Received: from mail-wm1-f48.google.com ([209.85.128.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vg0fq-0005sy-4o for kgdb-bugreport@lists.sourceforge.net;
 Wed, 14 Jan 2026 13:12:34 +0000
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-477619f8ae5so64647955e9.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 14 Jan 2026 05:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768396342; x=1769001142; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ucpTGToIn8N6Wm60fm7MZ05SRRlKYptl+ek5X25PfwQ=;
 b=Dge8REkc5NEFS1Q8xP3EO8XGw5beLE/1E6SbXlhKbSw7VN6DOo1TerbC/7hqqev5uT
 8yrl5mj+0HDlJEgZ/zdno+0t0S+/pKgh/4GIT9NCie94H6UGIZMVbghAPqxQMpjhTu4N
 BaYRKLpLggbxbHCNJGsxHHltGav7Hzqc/Z+nbFNv1cNDxhL2e/9hQcsP6qf+8ulecj8D
 U5U+FnY5l7uSQ3ZVF2/us1VFIvYZxLXf5JMFDP+ot+tFiK88irG8ZeFDIRHu9MTk2J98
 vtvpt/gwYrXCUQZznFYjAkGPDGmcKATe0robgXQSd+AMIaN9vI5A25zrr6+h1O+JGOYA
 27TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768396342; x=1769001142;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ucpTGToIn8N6Wm60fm7MZ05SRRlKYptl+ek5X25PfwQ=;
 b=dg3xjQm5GJO3OfVDHpeEmwOmWWiaMJQHchLTBs6zOWmrDWFNlP3M/Gtb+8KqFI1OwO
 GyZqkKzCKs01mK6AWStzHL3alJg0odaAV1Q0a1lwPFX/G3Bcs4Sc/d8WXQj0BcRvXWuc
 nGa5I6ptiyV+UANLkkpsMqR6IZgMmLNqL1aCWfbGcQRywMCTNykowQ9LN6R9oChesddz
 UTAY9adzeB8O0sZ0BG2fOQTwqUS4e9AqYJ+L6zOOHGn3Tnj5hgGgdYPqeFJ8vSBTsN9C
 WSp1a7uOaKh6zK+rVcuvUazK7F5kP8qt5T77D9BfcrvS0BKY3YgkP7rqJ7js5T0mHmxs
 BYyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBP2hVENEj8QKgudkzewaVNq3E4OSDikldoz9fhdQv+o97+3GPtE5mSsVtOiBRxg3o5nJ5Zy+bJGnk7kjYrA==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzIrjdOeUauk2WknPEFruhSJITW7m9lAF0Y/lwd+o6mFH4WpldT
 P5WCi24TbuGVWhxICO/69IHuS4T4EPnez6vIUlUoBGqFdKIBJFwM/NENwjyItcqk2TY=
X-Gm-Gg: AY/fxX4HWbTiRE+AiRsKJuHWN7cXSEU7Xkk3MWd47jVf77WV27tv0eGmOOkSXyQecM0
 hiXcpQxvcVriLFqBjkRXmCE3fcKdzOWXcPU16N2f/gJ0MrfNU/4/4eA5SuxkB3jMZXhnSq5pRW4
 EmcqGfrAqt+4JLQZaxASWndG7KSwYmbMiQYA1wDQ+1crQGTiXygxYxatYd5x1bj096+INysQu2G
 RsXstKdAmv8ms4QiHxtVtnU/4VFgC1WLd8OtBV8o1Ecs2risM+ZJ/Su7Arqib38/UxeU5Vzu2bT
 qofjuMti4mX41dW/waDCg6+0Ef57vtkuiMzS+l9MszzK7k5FHYntDHOVT67j0XGrQKAwEzD+ACb
 36wVIQO5Qx/ArU58HJ0e+CRj1ah+4q0t5mp69OLyo+tNsabT0MgzCw98Qb+a7R92MeGpC4cHpqS
 UcsEbsNFiTwgdoPvxRHzYp9rt3
X-Received: by 2002:a05:600c:5490:b0:479:3876:22a8 with SMTP id
 5b1f17b1804b1-47ee3356d5dmr36820375e9.16.1768396341643; 
 Wed, 14 Jan 2026 05:12:21 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ee54b8c9bsm27274065e9.3.2026.01.14.05.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 05:12:21 -0800 (PST)
Date: Wed, 14 Jan 2026 14:12:18 +0100
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aWeWMga1VaT0sYwj@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-4-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-4-21a291bcf197@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat 2025-12-27 09:16:11, Marcos Paulo de Souza wrote: >
 This change partially reverts commit 9e70a5e109a4 > ("printk: Add per-console
 suspended state"). The intent of the original > commit was to m [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.48 listed in wl.mailspike.net]
X-Headers-End: 1vg0fq-0005sy-4o
Subject: Re: [Kgdb-bugreport] [PATCH 04/19] printk: Reintroduce
 consoles_suspended global state
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
 Shan-Chun Hung <schung@nuvoton.com>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Breno Leitao <leitao@debian.org>, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Sat 2025-12-27 09:16:11, Marcos Paulo de Souza wrote:
> This change partially reverts commit 9e70a5e109a4
> ("printk: Add per-console suspended state"). The intent of the original
> commit was to move the management of the console suspended state to the
> consoles themselves to be able to use SRCU instead of console lock.
> 
> But having a global state is still useful when checking if the global
> suspend was triggered by power management. This way, instead of setting
> the state of each individual console, the code would only set/read from the
> global state.
> 
> Along with this change, two more fixes are necessary: change
> console_{suspend,resume} to set/clear CON_SUSPEND instead of setting
> CON_ENABLED and change show_cons_active to call __console_is_usable to
> check console usefulness.

I would invert the logic a bit. I think that the main motivation
is to replace CON_ENABLE -> CON_SUSPEND.

<proposal>
The flag CON_ENABLE is cleared when serial drivers get suspended. This
"hack" has been added by the commit 33c0d1b0c3ebb6 ("[PATCH] Serial
driver stuff") back in v2.5.28.

Stop hijacking CON_ENABLE flag and use the CON_SUSPEND flag instead.

Still allow to distinguish when:

  - the backing device is being suspended, see console_suspend().

  - the power management wants to calm down all consoles using
    a big-hammer, see console_suspend_all().

And restore the global "consoles_suspended" flag which was removed
by the commit 9e70a5e109a4 ("printk: Add per-console suspended state").

The difference is that accesses to the new global flag are
synchronized the same way as to the CON_SUSPEND flag. It allows
to read it under console_srcu_read_lock().

Finally, use __console_is_usable() in show_cons_active(). It is the
last location where the CON_ENABLED flag was checked directly.

The patch should not change the existing behavior because all users check
the state of the console using console_is_usable().
</proposal>

> diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
> index e2d92cf70eb7..7d2bded75b75 100644
> --- a/drivers/tty/tty_io.c
> +++ b/drivers/tty/tty_io.c
> @@ -3552,9 +3552,9 @@ static ssize_t show_cons_active(struct device *dev,
>  	for_each_console(c) {
>  		if (!c->device)
>  			continue;
> -		if (!(c->flags & CON_NBCON) && !c->write)
> -			continue;
> -		if ((c->flags & CON_ENABLED) == 0)
> +		if (!__console_is_usable(c, c->flags,
> +					 consoles_suspended,
> +					 NBCON_USE_ANY))

It would be better to move this into a separate patch.

>  			continue;
>  		cs[i++] = c;
>  		if (i >= ARRAY_SIZE(cs))

Otherwise, it looks good.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
