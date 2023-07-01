Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF09746069
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  3 Jul 2023 18:08:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qGM6Y-0000nb-F0
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 03 Jul 2023 16:08:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <groeck7@gmail.com>) id 1qFbmD-0000Xf-7Z
 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 01 Jul 2023 14:40:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uyUkD0mJUU/Zf9ldB9gHD2S/2d4V8ANSTIaihttQl0A=; b=S4FkeX965KHDmi2JKKjzIiaUiM
 Gju1r5mgQclbztZtlIXndq04Ydw9DHWfCitxmqJbXbXCE7ZVy1WR/Eh1GxE0ybrbINlU3kdE8tdp2
 iR28yveOvjhN6JYV3uCn9P6uXDuqB47nVIwYuyPUKOlbW26jKxreDr2/RClCSWlZ8//8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uyUkD0mJUU/Zf9ldB9gHD2S/2d4V8ANSTIaihttQl0A=; b=UJvIZDlCYQa6x2sTcu6/d/nbKx
 lhTqfwVl0VRkgg9jwR2IZLz/zPSXSu/+7rqM1izGEDGiLyG6uBibrCVy+V/EtfbB1kaFKN5UCqE90
 WF4VGsIjzbo2LXdInmGfnHZ8ysw90FOaJYZgOWNJEo/yLGue47rLzvzmzqzDBMUuVDCg=;
Received: from mail-pj1-f45.google.com ([209.85.216.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qFbm8-00006d-7E for kgdb-bugreport@lists.sourceforge.net;
 Sat, 01 Jul 2023 14:40:41 +0000
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-262fa79e9b3so1318101a91.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sat, 01 Jul 2023 07:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688222430; x=1690814430;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=uyUkD0mJUU/Zf9ldB9gHD2S/2d4V8ANSTIaihttQl0A=;
 b=IcDsm+rZ3hWCxWysGUBDBD5VD+zraq6+jUeIaKn/hFtcy9Dgr5iufxyQz/ygOH39mE
 dKiGEbAwOz8eJHxxFR55WRU7m202fAw12RiTvxzs5RHo6nbhnTtdSl9vjLQDwuPpFr/z
 TvqWtGPj6ulYtEAoYGwMzX2zyPasm2e1wbpEnozvkdR6lQUJ35w0J1Jy+siGUmFf5UjH
 cyNBZHheeVh8SCGH/hLqLeKWYGlmlyi9zqpcgdb7nIIezPoxwuP697JcW0aUKS6/EOTW
 Q8u1XdaYb+ICRxwdlNWbA5XSaRkEE1dnWAZEsbucaG8pYUT7P2RSzJAMx5thpCWC2gsn
 w6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688222430; x=1690814430;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uyUkD0mJUU/Zf9ldB9gHD2S/2d4V8ANSTIaihttQl0A=;
 b=D5KruPTf2FUERbfY8se2CIy+7BhEND4MwvJqNOo4giATn+NP6z0cStevE92c7QwPGN
 4opGPWUU7TfJnq9NjZOY8KIsRLGI6+LUSlTl+FMjAZeUvBOjB0y225y3IEPJubZWRL0e
 44EyqRmE7N6GsCXBTzBCa+6MdVR1kDnClFghBOte5ePFl3nv5Gu9Dggu6IedxILHL6dv
 aIsWz/EzJrCw3voCWDQH8H9fRNHCgeidlUKqoPXZwn0l9zCq9fj8mKlk6mjs/Hnk0Ik7
 na91M1efkI3osBnOYoUnId9b/o2wqVJlOig8+4UCasX1ko4/e2B2L25mco0ky7HVCmts
 dsZQ==
X-Gm-Message-State: ABy/qLaM1OsJ1EjJrXYcmoIPN2GV1ivlDpWNdXH/+YxKnDBykOOU0t7X
 58PUErh2egwoK0Rct4Zz+g1Cw9ecQ+Q=
X-Google-Smtp-Source: APBJJlEqX62QMvHa1JAPHGFp7Jlctzos+OPSmcIe4d+nG9szuHOt9QyZ+r1VUb70YbR27S9Oc5PE2w==
X-Received: by 2002:a17:90a:e60f:b0:262:e742:f40a with SMTP id
 j15-20020a17090ae60f00b00262e742f40amr3306132pjy.44.1688222430467; 
 Sat, 01 Jul 2023 07:40:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a170903120c00b001a69c1c78e7sm12361682plh.71.2023.07.01.07.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jul 2023 07:40:29 -0700 (PDT)
Date: Sat, 1 Jul 2023 07:40:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Petr Mladek <pmladek@suse.com>
Message-ID: <7cfc15f1-d8d0-4418-b7a1-5aa9e90e3fb3@roeck-us.net>
References: <20230616150618.6073-1-pmladek@suse.com>
 <20230616150618.6073-7-pmladek@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230616150618.6073-7-pmladek@suse.com>
X-Spam-Score: 0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jun 16, 2023 at 05:06:18PM +0200, Petr Mladek wrote:
 > The HAVE_ prefix means that the code could be enabled. Add another >
 variable
 for HAVE_HARDLOCKUP_DETECTOR_ARCH without this prefix. > It [...] 
 Content analysis details:   (0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.45 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [groeck7[at]gmail.com]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [groeck7[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.45 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1qFbm8-00006d-7E
X-Mailman-Approved-At: Mon, 03 Jul 2023 16:08:05 +0000
Subject: Re: [Kgdb-bugreport] [PATCH v2 6/6] watchdog/hardlockup: Define
 HARDLOCKUP_DETECTOR_ARCH
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
Cc: kgdb-bugreport@lists.sourceforge.net, Nicholas Piggin <npiggin@gmail.com>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, Jun 16, 2023 at 05:06:18PM +0200, Petr Mladek wrote:
> The HAVE_ prefix means that the code could be enabled. Add another
> variable for HAVE_HARDLOCKUP_DETECTOR_ARCH without this prefix.
> It will be set when it should be built. It will make it compatible
> with the other hardlockup detectors.
> 
> The change allows to clean up dependencies of PPC_WATCHDOG
> and HAVE_HARDLOCKUP_DETECTOR_PERF definitions for powerpc.
> 
> As a result HAVE_HARDLOCKUP_DETECTOR_PERF has the same dependencies
> on arm, x86, powerpc architectures.
> 
> Signed-off-by: Petr Mladek <pmladek@suse.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
...
> --- a/include/linux/nmi.h
> +++ b/include/linux/nmi.h
> @@ -9,7 +9,7 @@
>  #include <asm/irq.h>
>  
>  /* Arch specific watchdogs might need to share extra watchdog-related APIs. */
> -#if defined(CONFIG_HAVE_HARDLOCKUP_DETECTOR_ARCH) || defined(CONFIG_HARDLOCKUP_DETECTOR_SPARC64)
> +#if defined(CONFIG_HARDLOCKUP_DETECTOR_ARCH) || defined(CONFIG_HARDLOCKUP_DETECTOR_SPARC64)

This results in:

arch/powerpc/platforms/pseries/mobility.c: In function 'pseries_migrate_partition':
arch/powerpc/platforms/pseries/mobility.c:753:17: error: implicit declaration of function 'watchdog_hardlockup_set_timeout_pct'; did you mean 'watchdog_hardlockup_stop'? [-Werror=implicit-function-declaration]
  753 |                 watchdog_hardlockup_set_timeout_pct(factor);

with ppc64_defconfig -CONFIG_HARDLOCKUP_DETECTOR, because the dummy 
for watchdog_hardlockup_set_timeout_pct() is still defined in
arch/powerpc/include/asm/nmi.h which is no longer included.

Guenter

>  #include <asm/nmi.h>
>  #endif
>  


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
