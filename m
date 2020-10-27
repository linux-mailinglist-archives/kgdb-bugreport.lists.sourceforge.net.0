Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 812A929AB5E
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 27 Oct 2020 13:02:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kXNfu-00031N-B6
	for lists+kgdb-bugreport@lfdr.de; Tue, 27 Oct 2020 12:02:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1kXNfs-000317-Qq
 for kgdb-bugreport@lists.sourceforge.net; Tue, 27 Oct 2020 12:02:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kbxs+J5sPfu6cPuS3bXcQQmO/u3bwvvK/wU+a8aqxLo=; b=kSl+Huc4IlKQFM2hrw+r8nLdsh
 zeaPtjuTLOznuvrT+TRHh4MxqQr8VwbM1kmyDsuOs8Ak7Cp2P6J1tHEpja811gGFGBZCPfccRNIg0
 NMkyOUG8vlIUXWMGZYKfnI6/UGdn5KA5+pVvaZIWxj5cElJhHk7nS+MWbPhXg5oOUY+k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kbxs+J5sPfu6cPuS3bXcQQmO/u3bwvvK/wU+a8aqxLo=; b=eNBUp5dKu6wklkGUnJBT6Q/yO2
 uS3fLHByIp4HBQ1AkofdJBoAnc7xbF/ENWZqX6W8J3cEJDLeMQbUWVyQYHuAePl6Sg5G4gh1YjwRG
 PoTWbGtqgyCqnepo6Znm2zBvEnVJ48ytforQTzQiOlkQqaNIAx7JuyGkyZGNiDeyK0Mc=;
Received: from mail-wr1-f65.google.com ([209.85.221.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kXNfk-00FURO-SC
 for kgdb-bugreport@lists.sourceforge.net; Tue, 27 Oct 2020 12:02:00 +0000
Received: by mail-wr1-f65.google.com with SMTP id t9so1558738wrq.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 27 Oct 2020 05:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kbxs+J5sPfu6cPuS3bXcQQmO/u3bwvvK/wU+a8aqxLo=;
 b=mls1NZW71oioqb2nuOh2F/GFo3uEwBxjMt7ybKLTnhGYCRk867h6Vi1sueXbwnZ8XK
 Xx52OPkrLIMWzTT/zWUO5sM6xmW8Ho/ZFaxmE4K+hob+1Wk3DuaQE1ECnJAU2wYkc1J1
 X3dJ1keYQpjri19sucvQwOz82/bNiAft2DFrec8JMnyvRyy4Qgc7qJfrv82Wn41lVW7F
 2Cf7lRBowjgqjejzvreQtbiwR4ah2MfD4rvCaH6doOKN6OtFX2w5lF6v8qTH76CEa+d2
 haBXHCdTCnY8x0JXBCx6Fe9e+Su2BVhBndpogdL/uRxtTfOZ/aSA4dzdRbejv3rzmLjc
 NPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kbxs+J5sPfu6cPuS3bXcQQmO/u3bwvvK/wU+a8aqxLo=;
 b=LK/+zRQzqKb/B40sbxSDtkNImyJc+LPj2a3eLXMc6KjRhmOvWQcEfdJUcSyY9wsGfy
 jKhxLn3pDM8vMuRFjw/rQR0+b04h6t5pP4Y+H4MKraumU1EEBcoWIct5mhdfJkKdrEeT
 NwtWg+Huo4/OjKb2f8yh5ZY4QwL/U5yW8m6OHhNFepl2/GAl0BhA9D+M32jLfP7V1uoj
 kOKyprj2+6o32mbqYi2FMvshp97IC3fvVyAqjnwftIFis0KX71jHb1lEw/pch7uR+vgz
 lgD0P3R4Z0FCcs6rKroyey53C8ZsrhyWfRMsVYKYVWwiITMkNRn6vTPeZy/zii0Mz3ap
 GvBg==
X-Gm-Message-State: AOAM531DupOy/nxj74eIqGwPhxQiL/3s4M6ZRaBWGnsK5IuZm620J09P
 ChRvlIXekztyFC+SvnQ08fLWoQ==
X-Google-Smtp-Source: ABdhPJwQKqwdc9xILOo6w72PaDVewOm5U5rvFiS5jqZ7niiRh5OCGOr29/crlnX7Tea/DzdXL8SuBg==
X-Received: by 2002:a05:6000:1005:: with SMTP id
 a5mr2593352wrx.360.1603800099305; 
 Tue, 27 Oct 2020 05:01:39 -0700 (PDT)
Received: from holly.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id n5sm1703378wrm.2.2020.10.27.05.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 05:01:37 -0700 (PDT)
Date: Tue, 27 Oct 2020 12:01:34 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sasha Levin <sashal@kernel.org>
Message-ID: <20201027120134.iq44uw6bftumkivh@holly.lan>
References: <20201026235516.1025100-1-sashal@kernel.org>
 <20201026235516.1025100-31-sashal@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201026235516.1025100-31-sashal@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.65 listed in list.dnswl.org]
X-Headers-End: 1kXNfk-00FURO-SC
Subject: Re: [Kgdb-bugreport] [PATCH AUTOSEL 5.4 31/80] kgdb: Make "kgdbcon"
 work properly with "kgdb_earlycon"
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Oct 26, 2020 at 07:54:27PM -0400, Sasha Levin wrote:
> From: Douglas Anderson <dianders@chromium.org>
> 
> [ Upstream commit b18b099e04f450cdc77bec72acefcde7042bd1f3 ]
> 
> On my system the kernel processes the "kgdb_earlycon" parameter before
> the "kgdbcon" parameter.  When we setup "kgdb_earlycon" we'll end up
> in kgdb_register_callbacks() and "kgdb_use_con" won't have been set
> yet so we'll never get around to starting "kgdbcon".  Let's remedy
> this by detecting that the IO module was already registered when
> setting "kgdb_use_con" and registering the console then.
> 
> As part of this, to avoid pre-declaring things, move the handling of
> the "kgdbcon" further down in the file.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Link: https://lore.kernel.org/r/20200630151422.1.I4aa062751ff5e281f5116655c976dff545c09a46@changeid
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

kgdb[oc]_earlycon was a new feature introduced in v5.8 so, based on the
summary above, this fix does not obviously apply to older kernels.

However after looking closely...

I think the issue described above would also occur if kgdbdbgp (an
incomprehensible sequence consonants that translates to "present
debugger via USB EHCI debug") were used in conjunction with kgdbcon
meaning backporting does make sense.


Daniel.


> ---
>  kernel/debug/debug_core.c | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> index 2222f3225e53d..097ab02989f92 100644
> --- a/kernel/debug/debug_core.c
> +++ b/kernel/debug/debug_core.c
> @@ -96,14 +96,6 @@ int dbg_switch_cpu;
>  /* Use kdb or gdbserver mode */
>  int dbg_kdb_mode = 1;
>  
> -static int __init opt_kgdb_con(char *str)
> -{
> -	kgdb_use_con = 1;
> -	return 0;
> -}
> -
> -early_param("kgdbcon", opt_kgdb_con);
> -
>  module_param(kgdb_use_con, int, 0644);
>  module_param(kgdbreboot, int, 0644);
>  
> @@ -876,6 +868,20 @@ static struct console kgdbcons = {
>  	.index		= -1,
>  };
>  
> +static int __init opt_kgdb_con(char *str)
> +{
> +	kgdb_use_con = 1;
> +
> +	if (kgdb_io_module_registered && !kgdb_con_registered) {
> +		register_console(&kgdbcons);
> +		kgdb_con_registered = 1;
> +	}
> +
> +	return 0;
> +}
> +
> +early_param("kgdbcon", opt_kgdb_con);
> +
>  #ifdef CONFIG_MAGIC_SYSRQ
>  static void sysrq_handle_dbg(int key)
>  {
> -- 
> 2.25.1
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
