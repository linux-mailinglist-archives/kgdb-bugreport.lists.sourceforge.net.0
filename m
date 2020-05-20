Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 078631DB04A
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 20 May 2020 12:34:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jbM3Q-0000Yz-RZ
	for lists+kgdb-bugreport@lfdr.de; Wed, 20 May 2020 10:34:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jbM3P-0000YV-AW
 for kgdb-bugreport@lists.sourceforge.net; Wed, 20 May 2020 10:34:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wHwuK554VhbEDUoapI14azPz8Hgjvi50lBlxsWiVKX8=; b=fHLnWuxW1AzjclQyjbwxbMsR8e
 8JYizOWxnfY0R+AUQvbN2UMKDbu2IHFAYE4ed9uPMrpsOC5PgWexdJo59JvQ1BJNKmRD9Qwj0JA1V
 /Chh3sANUGfmxuPRmzbL4vApCPJUH1KJYtNZJmx4muU1gbQQcfWtICZ7A+UKO8Rtwutg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wHwuK554VhbEDUoapI14azPz8Hgjvi50lBlxsWiVKX8=; b=GUOu63ltlm/0ebNUezT3HxL0Wc
 liykctMsnsEY6sg3pIpQ5CEiZ1wEihTeXWobkcU3vnmAxDO01RMa6HlWtxyWHirBE+s/bX5V06bNg
 AfsypW/yB79TVgbb2Z9kRr/cctDcQwtekpnRO7b9JhF53nBkTCkagl7ma/JDkoxy9R6Y=;
Received: from mail-wm1-f66.google.com ([209.85.128.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jbM3L-008qcC-8K
 for kgdb-bugreport@lists.sourceforge.net; Wed, 20 May 2020 10:34:27 +0000
Received: by mail-wm1-f66.google.com with SMTP id g14so4412167wme.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 20 May 2020 03:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wHwuK554VhbEDUoapI14azPz8Hgjvi50lBlxsWiVKX8=;
 b=dZNC1J5ypymn1jU6Byg8EPaBtx0iN/1DIHceCLtkm5ZN62pZaAM6qLFo69H93K051w
 nEFHjWsNPV4ljKXRdpDRbIC2GxHPUuneGdFOqCabJABeFbEy0qZNxTyUZWuFZXtPhR99
 wwdZQtudQd/cHlInsliGMRW2QUx7CzktPvTf+BuhU4jurkcIzEs5qbRiHA8AWZAEjp6C
 tUBhEENQN3hN8Ob/5r+eI+wuJ+/MghjTgXBB8HkB7aqzL8wuv8QiRuRJ3494heAyIw0a
 WPD4KXjtaKv/JogXTODnC/Ip+MHz5vriC1ArcAq5dOXkzYPPdHABKpYeRBZMRq57iYHR
 lgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wHwuK554VhbEDUoapI14azPz8Hgjvi50lBlxsWiVKX8=;
 b=jyj9iHuio+UHxwTSmIt7yTf11drLzLZz2KasU5FBdVbFMvlWTKEDC3+45IavLTWsQZ
 DaRfd9S89Jh65L05CCYTKJcfqzVoh52ajzCQK2Be8mSklI3e1dhhUF/oY26YV3qoXbMl
 lDF5yuT27u/BCzDWfVMDzGU97KJSY6vtpK37Sofae4OgpI5wBJg0zVinDdj5keuMBtKQ
 RflksKN0xHSN8QohVjtWmGL1idVDA+4DRnFHvd0Igc3JyHinWYQGUBbvMunM97ShbrzS
 MZE9M3EawmjRHHNvT9tn0WX8MuSKe/jC4KlLdr770NBtQibxvM0uBi5dnRLCb0uN3AqO
 tY2w==
X-Gm-Message-State: AOAM532rxUlb8Qyo4SvhlxYjHE50tOi/A9walBOTgzxeaj/vFQCa7JM6
 cV8mw5WwKR6G60jocy4Xp1wZcg==
X-Google-Smtp-Source: ABdhPJxo5njsQyNYOEuPCeVVUlNTJmBhexBhhghXeVryIeeckAHJiBoMUenYHQrPUA509KHduFahjg==
X-Received: by 2002:a7b:ce08:: with SMTP id m8mr3869535wmc.97.1589970856782;
 Wed, 20 May 2020 03:34:16 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id f8sm2314536wrm.8.2020.05.20.03.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 03:34:16 -0700 (PDT)
Date: Wed, 20 May 2020 11:34:14 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20200520103414.bejflo3s4exrcyzk@holly.lan>
References: <20200519084345.1.I91670accc8a5ddabab227eb63bb4ad3e2e9d2b58@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200519084345.1.I91670accc8a5ddabab227eb63bb4ad3e2e9d2b58@changeid>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jbM3L-008qcC-8K
Subject: Re: [Kgdb-bugreport] [PATCH] kgdboc: Disable all the early code
 when kgdboc is a module
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jason Wessel <jason.wessel@windriver.com>, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>, kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, May 19, 2020 at 08:44:02AM -0700, Douglas Anderson wrote:
> When kgdboc is compiled as a module all of the "ekgdboc" and
> "kgdb_earlycon" code isn't useful and, in fact, breaks compilation.
> This is because early_param() isn't defined for modules and that's how
> this code gets configured.
> 
> It turns out that this was broken by commit eae3e19ca930 ("kgdboc:
> Remove useless #ifdef CONFIG_KGDB_SERIAL_CONSOLE in kgdboc") and then
> made worse by commit 220995622da5 ("kgdboc: Add kgdboc_earlycon to
> support early kgdb using boot consoles").  I guess the #ifdef wasn't
> so useless, even if it wasn't obvious why it was useful.  When kgdboc
> was compiled as a module only "CONFIG_KGDB_SERIAL_CONSOLE_MODULE" was
> defined, not "CONFIG_KGDB_SERIAL_CONSOLE".  That meant that the old
> module.
> 
> Let's basically do the same thing that the old code (pre-removal of
> the #ifdef) did but use "IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE)" to
> make it more obvious what the point of the check is.  We'll fix
> kgdboc_earlycon in a similar way.
> 
> Fixes: 220995622da5 ("kgdboc: Add kgdboc_earlycon to support early kgdb using boot consoles")
> Fixes: eae3e19ca930 ("kgdboc: Remove useless #ifdef CONFIG_KGDB_SERIAL_CONSOLE in kgdboc")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Applied, thanks!


Daniel.


> ---
> 
>  drivers/tty/serial/kgdboc.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
> index 34b5e91dd245..fa6f7a3e73b9 100644
> --- a/drivers/tty/serial/kgdboc.c
> +++ b/drivers/tty/serial/kgdboc.c
> @@ -43,9 +43,11 @@ static int			kgdb_tty_line;
>  
>  static struct platform_device *kgdboc_pdev;
>  
> +#if IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE)
>  static struct kgdb_io		kgdboc_earlycon_io_ops;
>  static struct console		*earlycon;
>  static int                      (*earlycon_orig_exit)(struct console *con);
> +#endif /* IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE) */
>  
>  #ifdef CONFIG_KDB_KEYBOARD
>  static int kgdboc_reset_connect(struct input_handler *handler,
> @@ -140,10 +142,19 @@ static void kgdboc_unregister_kbd(void)
>  #define kgdboc_restore_input()
>  #endif /* ! CONFIG_KDB_KEYBOARD */
>  
> -static void cleanup_kgdboc(void)
> +#if IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE)
> +static void cleanup_earlycon(void)
>  {
>  	if (earlycon)
>  		kgdb_unregister_io_module(&kgdboc_earlycon_io_ops);
> +}
> +#else /* !IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE) */
> +static inline void cleanup_earlycon(void) { }
> +#endif /* !IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE) */
> +
> +static void cleanup_kgdboc(void)
> +{
> +	cleanup_earlycon();
>  
>  	if (configured != 1)
>  		return;
> @@ -388,6 +399,7 @@ static struct kgdb_io kgdboc_io_ops = {
>  	.post_exception		= kgdboc_post_exp_handler,
>  };
>  
> +#if IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE)
>  static int kgdboc_option_setup(char *opt)
>  {
>  	if (!opt) {
> @@ -544,6 +556,7 @@ static int __init kgdboc_earlycon_init(char *opt)
>  }
>  
>  early_param("kgdboc_earlycon", kgdboc_earlycon_init);
> +#endif /* IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE) */
>  
>  module_init(init_kgdboc);
>  module_exit(exit_kgdboc);
> -- 
> 2.26.2.761.g0e0b3e54be-goog
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
