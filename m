Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 260191C1342
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  1 May 2020 15:32:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jUVm4-0005Bw-Sk
	for lists+kgdb-bugreport@lfdr.de; Fri, 01 May 2020 13:32:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jUVm3-0005BU-A1
 for kgdb-bugreport@lists.sourceforge.net; Fri, 01 May 2020 13:32:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CwB8SxSSgbYRqBwwUAkIWpdYejHT7kvKRjFIv7ghtlc=; b=Ckres0wKYTBkGy3JLUu2malexc
 TObVWdGOXChy4na8ox9aQ0v2W/JDxfSHcxmByo3vANV8/DxcnHt3BdkyWaS0pag5Sg6tfPL+puoNk
 YBB7OAa5m/7YUpGwHC3XbS30QSGGxB9Y44Jx4g58IuAlcXH/TayROdLCg15k8h4guE40=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CwB8SxSSgbYRqBwwUAkIWpdYejHT7kvKRjFIv7ghtlc=; b=k7+WNDqXIvh/mKmLXtPXxUWVOk
 +MDrN6qwEObu/XcEM4qnutH2tZ0pbBBiizc0g7GqYfKeyiW9GlbUtzUb/nq2U29Jcru0yEAedV1Jl
 hJpHoLM+EmkSlKcBXLN86QPCVIKj1bjbKPYfXhMyclvhjHbe7NUZBKTYQa/XbmlFQxeY=;
Received: from mail-wm1-f67.google.com ([209.85.128.67])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jUVlz-006ken-HA
 for kgdb-bugreport@lists.sourceforge.net; Fri, 01 May 2020 13:32:15 +0000
Received: by mail-wm1-f67.google.com with SMTP id e26so5971102wmk.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 01 May 2020 06:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CwB8SxSSgbYRqBwwUAkIWpdYejHT7kvKRjFIv7ghtlc=;
 b=Zv2DUkeX0KLYIj51PZCGPiis13gH28irsAEo3T69bAM2sws/ALOnM9thSDsY6gT3V1
 oVXhXrxAjKRN23sgEFKZQ9pz9KA6bEthwgNAWdgX60GselC+r04QNerVpTnj14R9aODI
 raczwgYvDHF4z015qXs+dQh0HxLXopjDOY4daNDxMu6eJBsgMuwyBLAiAIgBPGhWVDCQ
 SMY3gVjIB4jSDTYghOJjk+nD6RFc0vycq9GbTlZUmtICrD/ImCajAjuHnoBMuTWeS0Ld
 /CasZuOzbRVvH4grnHn8i1jSu8PJWpkg12tu0QVgVg0Z/2PBSa0Bwa3VxQ0kBxd8zj0p
 rR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CwB8SxSSgbYRqBwwUAkIWpdYejHT7kvKRjFIv7ghtlc=;
 b=a5ejYAKJK6v3sP65fYvEpfAluE9RMe9fDdlyVugzgXLMlyoX0gM+J9EnPpp+hE94zs
 9C347OBTrEtPcGyd/PVAC3LxgADxd64LTtz6aHsZeUOKZ3uErjNzSOR6ULvwXHREElhY
 av9NLM96dc6eSTbdP8HUARxfxWQaKwCftkPlzD2EWi+xWMEMHWRkWFpZncU2qh+B5w9d
 hVflpxbQWSYJpAIgjj0upYwV33fml5kJPnAXkRGb6KlWcZLJSrWbm1YJWH1o6HI7O52A
 kpXTMho+YbWapwVkZJnWaHVvjiHEIYexjGvccUgGSaPrPc/nroItfUc5XEAX1qoyHYzK
 Br4g==
X-Gm-Message-State: AGi0PubmPrSo4H97EOKQXU8it9VlHIyaWKPgFYrV/wlGIObiciAknmVs
 +9ktxTmbjt9WjXSmCD11CYKkEA==
X-Google-Smtp-Source: APiQypIM0zV3rCKxAnet9INB91hMWd5nvcSwEEe+HmDOGq2ZyIDIQqa7aRKUbOPSlWCxsUu5rhOjfA==
X-Received: by 2002:a1c:9d0d:: with SMTP id g13mr4251299wme.102.1588339924824; 
 Fri, 01 May 2020 06:32:04 -0700 (PDT)
Received: from wychelm.lan
 (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id t17sm4293272wro.2.2020.05.01.06.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 06:32:03 -0700 (PDT)
Date: Fri, 1 May 2020 14:32:02 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20200501133202.GA2402281@wychelm.lan>
References: <20200430095819.1.Id37f71c69eb21747b9d9e2c7c242be130814b362@changeid>
 <20200501114943.ioetuxe24gi27bll@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200501114943.ioetuxe24gi27bll@holly.lan>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jUVlz-006ken-HA
Subject: Re: [Kgdb-bugreport] [PATCH] kgdboc: Be a bit more robust about
 handling earlycon leaving
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, May 01, 2020 at 12:49:43PM +0100, Daniel Thompson wrote:
> On Thu, Apr 30, 2020 at 09:59:09AM -0700, Douglas Anderson wrote:
> > The original implementation of kgdboc_earlycon included a comment
> > about how it was impossible to get notified about the boot console
> > going away without making changes to the Linux core.  Since folks
> > often don't want to change the Linux core for kgdb's purposes, the
> > kgdboc_earlycon implementation did a bit of polling to figure out when
> > the boot console went away.
> > 
> > It turns out, though, that it is possible to get notified about the
> > boot console going away.  The solution is either clever or a hack
> > depending on your viewpoint.  ...or, perhaps, a clever hack.  All we
> > need to do is head-patch the "exit" routine of the boot console.  We
> > know that "struct console" must be writable because it has a "next"
> > pointer in it, so we can just put our own exit routine in, do our
> > stuff, and then call back to the original.
> 
> I think I'm in the hack camp on this one!
> 
>  
> > This works great to get notified about the boot console going away.
> > The (slight) problem is that in the context of the boot console's exit
> > routine we can't call tty_find_polling_driver().
> 
> I presume this is something to do with the tty_mutex?
> 
> 
> > We solve this by
> > kicking off some work on the system_wq when we get notified and this
> > works pretty well.
> 
> There are some problems with the workqueue approach.

... so did a couple of experiments to avoid the workqueue.

It occured to me that, since we have interfered with deinit() then the
console hasn't actually been uninitialized meaning we could still use it.
This does exposes us to risks similar to keep_bootcon but in exchange
there is no window where kgdb is broken (and no need to panic). 

My prototype is minimal but I did wonder about ripping out all the
code to defend against removal of the earlycon and simply keep the
earlycon around until a new kgdbio handler is installed.


Daniel.


diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
index 596213272ec3..05d58f9f38b1 100644
--- a/drivers/tty/serial/kgdboc.c
+++ b/drivers/tty/serial/kgdboc.c
@@ -46,6 +46,7 @@ static struct platform_device *kgdboc_pdev;
 #ifdef CONFIG_KGDB_SERIAL_CONSOLE
 static struct kgdb_io		kgdboc_earlycon_io_ops;
 struct console			*earlycon;
+static int                      (*earlycon_orig_exit)(struct console *con);
 #else /* ! CONFIG_KGDB_SERIAL_CONSOLE */
 #define earlycon NULL
 #endif /* ! CONFIG_KGDB_SERIAL_CONSOLE */
@@ -478,25 +479,28 @@ static void kgdboc_earlycon_put_char(u8 chr)
 	earlycon->write(earlycon, &chr, 1);
 }
 
-static void kgdboc_earlycon_pre_exp_handler(void)
+static int kgdboc_earlycon_deferred_exit(struct console *con)
 {
 	/*
-	 * We don't get notified when the boot console is unregistered.
-	 * Double-check when we enter the debugger.  Unfortunately we
-	 * can't really unregister ourselves now, so we panic.  We rely
-	 * on kgdb's ability to detect re-entrancy to make the panic
-	 * take effect.
-	 *
-	 * NOTE: if you're here in the lull when the real console has
-	 * replaced the boot console but our init hasn't run yet it's
-	 * possible that the "keep_bootcon" argument may help.
+	 * restoring the exit function ensures the earlycon is
+	 * deinitialized when/if we find a suitable tty
 	 */
-	if (earlycon && !is_earlycon_still_valid())
-		panic("KGDB earlycon vanished and nothing replaced it\n");
+	con->exit = earlycon_orig_exit;
+
+	return 0;
 }
 
 static void kgdboc_earlycon_deinit(void)
 {
+	if (!earlycon)
+		return;
+
+	if (earlycon->exit == kgdboc_earlycon_deferred_exit) {
+		earlycon->exit = earlycon_orig_exit;
+	} else if (earlycon->exit) {
+		earlycon->exit(earlycon);
+	}
+
 	earlycon = NULL;
 }
 
@@ -504,7 +508,6 @@ static struct kgdb_io kgdboc_earlycon_io_ops = {
 	.name			= "kgdboc_earlycon",
 	.read_char		= kgdboc_earlycon_get_char,
 	.write_char		= kgdboc_earlycon_put_char,
-	.pre_exception		= kgdboc_earlycon_pre_exp_handler,
 	.deinit			= kgdboc_earlycon_deinit,
 	.is_console		= true,
 };
@@ -562,6 +565,9 @@ static int __init kgdboc_earlycon_init(char *opt)
 		return 0;
 	}
 
+	earlycon_orig_exit = con->exit;
+	con->exit = kgdboc_earlycon_deferred_exit;
+
 	return 0;
 }
 early_param("kgdboc_earlycon", kgdboc_earlycon_init);


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
