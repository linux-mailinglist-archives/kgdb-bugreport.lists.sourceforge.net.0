Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9052F719CE2
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  1 Jun 2023 15:04:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q4hyJ-0005sW-DO
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 01 Jun 2023 13:04:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1q4hyH-0005sL-DJ
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 01 Jun 2023 13:04:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u3dPTilvXGp8uxMn4l+Fg2INpSwUqim9wefqzjAgkeE=; b=nJPlI/2mwQpszwB8j6vixiK7JL
 HOEEtzOIYDYG4wrf+aehGbGLQB+YzFnCergDVCYfO6nxsvQ/XXZxLalnRbtAC7307/W0SeD/VY4GY
 wcBH8po4K9qmwG+jflkjc1cl32298Buq/cuOZiSZeLH4+9hvUopmUaZoL5J2X4a2T8iw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u3dPTilvXGp8uxMn4l+Fg2INpSwUqim9wefqzjAgkeE=; b=NKbId5m4RgePXie6QEU0AqhjyY
 GQTPgMiLZeXOxuYDTI9uVAM+KyVRQwpCOSVU1uO9HLUaDb5ipwnhAeT5Zf+98KDdHmpYf+oACe5Nx
 8iM1Wz9Ws6ntJLXfdXDBFIpxWaX2HQjSCNjETgt3dUOmkKHRYrUWDjYZqOzRB3i4u/UA=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q4hyA-0002m3-CU for kgdb-bugreport@lists.sourceforge.net;
 Thu, 01 Jun 2023 13:04:04 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 2C0F221980;
 Thu,  1 Jun 2023 13:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1685624632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u3dPTilvXGp8uxMn4l+Fg2INpSwUqim9wefqzjAgkeE=;
 b=sWoQjeSwqeyLwmTMHbHRK38BwL4BPEazkQloeg0LItKG4j9/aawcmj88GFMKrHarpA8e0E
 Ehq1Nt90b/lKIx9jbgcaGJiZEnTuSUReqF0MI+X4gZtM4+WPi/yWoq4XBhz7ZoTF3XDyX7
 nrCbe+8EAxSy9O43hxhmGrxArfXGyzc=
Received: from suse.cz (pmladek.udp.ovpn2.prg.suse.de [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 4B9812C142;
 Thu,  1 Jun 2023 13:03:48 +0000 (UTC)
Date: Thu, 1 Jun 2023 15:03:44 +0200
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <ZHiXMK1QPlCpTmKV@alley>
References: <20230527014153.2793931-1-dianders@chromium.org>
 <20230526184139.10.I821fe7609e57608913fe05abd8f35b343e7a9aae@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230526184139.10.I821fe7609e57608913fe05abd8f35b343e7a9aae@changeid>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2023-05-26 18:41:40,
 Douglas Anderson wrote: > HAVE_HARDLOCKUP_DETECTOR_NON_ARCH
 is a mouthful and > confusing. HAVE_HARDLOCKUP_DETECTOR_PERF_OR_BUDDY is
 even more of a > mouthful, but probably [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q4hyA-0002m3-CU
Subject: Re: [Kgdb-bugreport] [PATCH 10/10] watchdog/hardlockup: Rename
 HAVE_HARDLOCKUP_DETECTOR_NON_ARCH to ..._PERF_OR_BUDDY
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-perf-users@vger.kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, sparclinux@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri 2023-05-26 18:41:40, Douglas Anderson wrote:
> HAVE_HARDLOCKUP_DETECTOR_NON_ARCH is a mouthful and
> confusing. HAVE_HARDLOCKUP_DETECTOR_PERF_OR_BUDDY is even more of a
> mouthful, but probably less confusing. Rename the Kconfig names.

It is better. But I have an idea that might be even better.

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  lib/Kconfig.debug | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index eb1edd5905bc..b9e162698a82 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -1058,7 +1058,7 @@ config HARDLOCKUP_DETECTOR_BUDDY
>  # needs SMP). In either case, using the "non-arch" code conflicts with
>  # the NMI watchdog code (which is sometimes used directly and sometimes used
>  # by the arch-provided hardlockup detector).

The comment above still uses the term "no-arch" and tries to
explain the confusion around it.

> -config HAVE_HARDLOCKUP_DETECTOR_NON_ARCH
> +config HAVE_HARDLOCKUP_DETECTOR_PERF_OR_BUDDY
>  	bool
>  	depends on (HAVE_HARDLOCKUP_DETECTOR_PERF || SMP) && !HAVE_NMI_WATCHDOG
>  	default y
> @@ -1077,10 +1077,10 @@ config HARDLOCKUP_DETECTOR_PREFER_BUDDY
>  	  an arch-specific hardlockup detector or if resources needed
>  	  for the hardlockup detector are better used for other things.
>  
> -# This will select the appropriate non-arch hardlockdup detector
> -config HARDLOCKUP_DETECTOR_NON_ARCH
> +# This will select the appropriate non-arch hardlockup detector
> +config HARDLOCKUP_DETECTOR_PERF_OR_BUDDY
>  	bool
> -	depends on HAVE_HARDLOCKUP_DETECTOR_NON_ARCH
> +	depends on HAVE_HARDLOCKUP_DETECTOR_PERF_OR_BUDDY
>  	select HARDLOCKUP_DETECTOR_BUDDY if !HAVE_HARDLOCKUP_DETECTOR_PERF || HARDLOCKUP_DETECTOR_PREFER_BUDDY
>  	select HARDLOCKUP_DETECTOR_PERF if HAVE_HARDLOCKUP_DETECTOR_PERF && !HARDLOCKUP_DETECTOR_PREFER_BUDDY
>  
> @@ -1098,9 +1098,9 @@ config HARDLOCKUP_CHECK_TIMESTAMP
>  config HARDLOCKUP_DETECTOR
>  	bool "Detect Hard Lockups"
>  	depends on DEBUG_KERNEL && !S390
> -	depends on HAVE_HARDLOCKUP_DETECTOR_NON_ARCH || HAVE_HARDLOCKUP_DETECTOR_ARCH
> +	depends on HAVE_HARDLOCKUP_DETECTOR_PERF_OR_BUDDY || HAVE_HARDLOCKUP_DETECTOR_ARCH
>  	select LOCKUP_DETECTOR
> -	select HARDLOCKUP_DETECTOR_NON_ARCH if HAVE_HARDLOCKUP_DETECTOR_NON_ARCH
> +	select HARDLOCKUP_DETECTOR_PERF_OR_BUDDY if HAVE_HARDLOCKUP_DETECTOR_PERF_OR_BUDDY
>  
>  	help
>  	  Say Y here to enable the kernel to act as a watchdog to detect

I am sorry but I am still confused by the logic. For me, it is far
from clear what combinations are possible, impossible, and optional.

Especially, the effect of HAVE_NMI_WATCHDOG and
HAVE_HARDLOCKUP_DETECTOR_ARCH is quite tricky.

I was playing with it and came up with a more straightforward solution
and found more possibilities how the simplify the logic. I am going
to prepare a patchset that would replace this patch.

Just to get the idea. I made the following changes:

     + define the values in logical order:
	+ HAVE_*
	+ HARDLOCKUP_DETECTOR y/n value
	+ HARDLOCKUP_DETECTOR_PREFER_BUDDY y/n value
	+ HARDLOCKUP_DETECTOR_PERF decision based on above
	+ HARDLOCKUP_DETECTOR_BUDDY decision based on above

     + remove HAVE_HARDLOCKUP_DETECTOR_PERF_OR_BUDDY,
       instead, explicitly define the dependencies on all HAVE_*
       variables to make it clear what it possible
       and what is not possible

     + remove HARDLOCKUP_DETECTOR_PERF_OR_BUDDY,
       instead use "imply" in HARDLOCKUP_DETECTOR to trigger
       re-evaluation of HARDLOCKUP_DETECTOR_PERF and
       HARDLOCKUP_DETECTOR_BUDDY decisions


My current version has the following in lib/Kconfig.devel:

--- cut ---
config HAVE_HARDLOCKUP_DETECTOR_BUDDY
	bool
	depends on SMP
	default y

#
# arch/ can define HAVE_NMI_WATCHDOG to provide their own hard
# lockup detector rather than the generic perf or buddy detector.
#
config HARDLOCKUP_DETECTOR
	bool "Detect Hard Lockups"
	depends on DEBUG_KERNEL && !S390
	depends on HAVE_HARDLOCKUP_DETECTOR_PERF || HAVE_HARDLOCKUP_DETECTOR_BUDDY || HAVE_NMI_WATCHDOG
	imply HARDLOCKUP_DETECTOR_PERF
	imply HARDLOCKUP_DETECTOR_BUDDY
	select LOCKUP_DETECTOR

	help
	  Say Y here to enable the kernel to act as a watchdog to detect
	  hard lockups.

	  Hardlockups are bugs that cause the CPU to loop in kernel mode
	  for more than 10 seconds, without letting other interrupts have a
	  chance to run.  The current stack trace is displayed upon detection
	  and the system will stay locked up.

#
# The architecture-specific variant is always used when available,
# see HAVE_NMI_WATCHDOG
#
config HARDLOCKUP_DETECTOR_PREFER_BUDDY
	bool "Prefer the buddy CPU hardlockup detector"
	depends on HARDLOCKUP_DETECTOR
	depends on HAVE_HARDLOCKUP_DETECTOR_PERF && HAVE_HARDLOCKUP_DETECTOR_BUDDY && !HAVE_NMI_WATCHDOG
	default n
	help
	  Say Y here to prefer the buddy hardlockup detector over the perf one.

	  With the buddy detector, each CPU uses its softlockup hrtimer
	  to check that the next CPU is processing hrtimer interrupts by
	  verifying that a counter is increasing.

	  This hardlockup detector is useful on systems that don't have
	  an arch-specific hardlockup detector or if resources needed
	  for the hardlockup detector are better used for other things.

config HARDLOCKUP_DETECTOR_PERF
	bool
	depends on HARDLOCKUP_DETECTOR
	depends on HAVE_HARDLOCKUP_DETECTOR_PERF && !HARDLOCKUP_DETECTOR_PREFER_BUDDY && !HAVE_NMI_WATCHDOG
	select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER

config HARDLOCKUP_DETECTOR_BUDDY
	bool
	depends on HARDLOCKUP_DETECTOR
	depends on HAVE_HARDLOCKUP_DETECTOR_BUDDY
	depends on HARDLOCKUP_DETECTOR_PREFER_BUDDY || !HAVE_HARDLOCKUP_DETECTOR_PERF
	depends on !HAVE_NMI_WATCHDOG
	select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER

# Both the "perf" and "buddy" hardlockup detectors need counting hrtimer
# interrupts.
config HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
	bool
	depends on HARDLOCKUP_DETECTOR_PERF || HARDLOCKUP_DETECTOR_BUDDY
	select SOFTLOCKUP_DETECTOR
--- cut ---

Also I am going to break the dependency between HAVE_NMI_WATCHDOG and
HAVE_HADRDLOCKUP_DETECTOR_ARCH. HAVE_NMI_WATCHDOG is needed only
for the very special powerpc64 watchdog. I am going to make sure
that it will be used only there and it will not be needed for
sparc and arm. As a result, we would have 4 separate implementations:

    + HAVE_HARDLOCKUP_DETECTOR_BUDDY enabled on any SMP system

    + HAVE_HARDLOCKUP_DETECTOR_PERF enabled on architectures supporting
	this perf-based solution

    + HAVE_HARDLOCKUP_DETECTOR_ARCH enabled on architectures which
	need another solution instead of the perf interface;
	they would support the usual HARDLOCKUP_DETECTOR command
	line parameters and sysctl interface

    + HAVE_NMI_WATCHDOG enabled just on powerpc64; it is special
	solution with its own command line parameters. Also it does
	not support hardlockup sysctl interface. I think about
	renaming it to HAVE_HARDLOCKUP_DETECTOR_POWERPC64 or
	_CUSTOM.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
