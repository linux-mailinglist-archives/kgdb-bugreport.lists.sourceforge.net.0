Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E1E1DA0CD
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 19 May 2020 21:15:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jb7hj-00050I-9P
	for lists+kgdb-bugreport@lfdr.de; Tue, 19 May 2020 19:15:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jb7hg-000509-Um
 for kgdb-bugreport@lists.sourceforge.net; Tue, 19 May 2020 19:15:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wEq9P5HnCfUm9vk24Pjpsrg932s/fp+shOA9bBHZRYI=; b=T6QXDPBf0gqjFYk3deZao8j0hb
 62p92ImOTRCJ7kXwiKYxUhDqUd7fuNs4542imeP3YDoCeD1INt0keUZF2F1BQ4WAOXleZsGUMHLLJ
 LqowUs9igp/AhX3u2cRgO4y2W6d41M8oVUzd6f5wDybc48iIXKAXo2kz0jZ2hN7CdF2k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wEq9P5HnCfUm9vk24Pjpsrg932s/fp+shOA9bBHZRYI=; b=XDfaikGt5cFwozN1v+1NAAEj/h
 VdJec0VfF+FQRtsVulY3SKdUBeFfvcwpHKoREGUKHslitPqZu2dEO3Jfx/jzTHumDXcK7tBZnZw7b
 1K4TqbInc2KYleOXSjQIiWWyPVKY2nguDQ80fTVMGjEaeGW/6T6HydF54p1Zf/tmKeKI=;
Received: from mail-wr1-f65.google.com ([209.85.221.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jb7hd-0013CY-32
 for kgdb-bugreport@lists.sourceforge.net; Tue, 19 May 2020 19:15:04 +0000
Received: by mail-wr1-f65.google.com with SMTP id s8so615087wrt.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 19 May 2020 12:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wEq9P5HnCfUm9vk24Pjpsrg932s/fp+shOA9bBHZRYI=;
 b=U1v22pjdFEgh26Q4N8u+nq5aSkSji6AanM9ZXmU8FbY4MF7bqry7qJkOOpyirOvWAf
 T76R5DNl7HninB1H8gou4BB4vUBhGEHAGqrc9OL9Uxks65TuU54aRzTe3ytKGOTYYlGN
 YQE8z18HTvOBDcHd0uDpHEn92X6ru2QZ7rzpGMTWCSFGkzCl36SK/HWZmTDSniGdytln
 RzGeu8z3GlkkGyH+cypz1adDeSJf8AypJD6L+o/pgFDEQIKyDJAJk8kqxVB1ieD5v7cj
 G7O+SBYIbU6cee0ZUV9VZR+sOr5RfteCzNmOlDOaxyyxJU2BJAlyyFn73ZoodsFsce6z
 h9CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wEq9P5HnCfUm9vk24Pjpsrg932s/fp+shOA9bBHZRYI=;
 b=bpPDa21GAGUyZ9lhwKRThHUsAf3qcU5eZe2r0ORjY7KwoOYyJpu3yp2JObV8relXb3
 eXuZ/sJbtucgg2mvdCiTkZvjEFxCOtSBvQRbs8z8F+PdcnF29IazjE6TsRdBg84XRNjk
 zB6mqeP9ULuNVV4O5QXfCtKevaamx8BkFu/+UdL7QyGIhG7VneN3HsnhLCeBbHe49ruX
 SX+4b3THqPFvbK0B+2CHE7WW7idIRWr1Oxj3t+9gfwvZn00I3IhkN3SCeiqU5t0ad9ea
 gP+SaqKcRCjAsW+Lzb/jzO1sUQ/kYYe6v0NrhZo5OJdOKb4cOZ/IAO8Q0vtmeFUV5VZU
 GJaA==
X-Gm-Message-State: AOAM532EHUmMK12bkjx9vAzgvgJwZprLoyUThRuD8QdZV93uTCJcSEyA
 06Ev92At7v7v/TkbzBkBXju9dg==
X-Google-Smtp-Source: ABdhPJyQADGkHTqT9aWT/EdvTBmXbqG4ivJlWWFIusns8fU2Ap7T2kPHiX/RkUx6bu28om/YBrHVWg==
X-Received: by 2002:a05:6000:11ca:: with SMTP id
 i10mr453589wrx.10.1589915689318; 
 Tue, 19 May 2020 12:14:49 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id v2sm464710wrn.21.2020.05.19.12.14.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 12:14:48 -0700 (PDT)
Date: Tue, 19 May 2020 20:14:46 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20200519191446.ybe2phdzac6vxyzx@holly.lan>
References: <20200519084345.1.I91670accc8a5ddabab227eb63bb4ad3e2e9d2b58@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200519084345.1.I91670accc8a5ddabab227eb63bb4ad3e2e9d2b58@changeid>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.65 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.65 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jb7hd-0013CY-32
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

Thanks Doug. I've got this running though my build checks now (which
I have just noted an improvement for ;-) ) and will get it into
kgdb/for-next as soon as possible.


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
