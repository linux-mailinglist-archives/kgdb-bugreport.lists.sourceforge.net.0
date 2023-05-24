Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6BD70F7C5
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 24 May 2023 15:38:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q1ohX-0006sK-Qz
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 24 May 2023 13:38:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1q1ohW-0006sE-2K
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 24 May 2023 13:38:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o9PpiufmZYzleg+TlrTh557lZlXDEM/AsL/PhNB0ois=; b=cVrrjIH4kuqFWTLY2M53Qd/52C
 oOwKeNZCx/pabRvmUPNBGtGiqLMjlQBUchR+5hEipvp8SsfH4XTt9PnHD+dcWddzf81YN8vcplq9z
 sjkfcbK2ZBj7b1YSOcBQNBSLGBjfkEk52SiZrvDaF7E+fLEcGG6+epgbP53Y2D+vF3f4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o9PpiufmZYzleg+TlrTh557lZlXDEM/AsL/PhNB0ois=; b=F3n1EHqF8/JPOORby2KxyQtT++
 mfq1kOyIZ0qoZGJXeVffg5dwz3jUHHG/dXeS3KeEy2lMtYN5FpNrcccWzv/5HvOketc3kg6/5ychR
 +90TqK1Skn9U1E9/TGIcfES644MoEIijekvmiFs27V3CUrxRNGIaX7sSte5S5LDIKgFA=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q1ohS-0001oO-Mk for kgdb-bugreport@lists.sourceforge.net;
 Wed, 24 May 2023 13:38:50 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 82F0E21FE4;
 Wed, 24 May 2023 13:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1684935517; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o9PpiufmZYzleg+TlrTh557lZlXDEM/AsL/PhNB0ois=;
 b=b+R628QlRTNsSzyUC35Lh1Knve1z2zY9IzRDNTMeINWO8KcOzZ3/0LdvMfmwhO3yUgN9u0
 3NjN78LPfVkSTa/C8qWoZJEhRh0s7kTbxRKhntcnuX12jzeNk1N45LuX7TCP5yoMvJy4ij
 lnbnezv8q8w8QHqxzgg76qOTb5SCv3E=
Received: from suse.cz (dhcp129.suse.cz [10.100.51.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 3F3BE2C141;
 Wed, 24 May 2023 13:38:36 +0000 (UTC)
Date: Wed, 24 May 2023 15:38:35 +0200
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <ZG4TW--j-DdSsUO6@alley>
References: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
 <20230519101840.v5.12.I91f7277bab4bf8c0cb238732ed92e7ce7bbd71a6@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230519101840.v5.12.I91f7277bab4bf8c0cb238732ed92e7ce7bbd71a6@changeid>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2023-05-19 10:18:36, Douglas Anderson wrote: > Do a
 search and replace of: > - NMI_WATCHDOG_ENABLED => WATCHDOG_HARDLOCKUP_ENABLED
 > - SOFT_WATCHDOG_ENABLED => WATCHDOG_SOFTOCKUP_ENABLED > - wa [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q1ohS-0001oO-Mk
Subject: Re: [Kgdb-bugreport] [PATCH v5 12/18] watchdog/hardlockup: Rename
 some "NMI watchdog" constants/function
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 ito-yuichi@fujitsu.com, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 Marc Zyngier <maz@kernel.org>, christophe.leroy@csgroup.eu,
 Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com,
 Tzung-Bi Shih <tzungbi@chromium.org>, npiggin@gmail.com,
 Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 mpe@ellerman.id.au, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri 2023-05-19 10:18:36, Douglas Anderson wrote:
> Do a search and replace of:
> - NMI_WATCHDOG_ENABLED => WATCHDOG_HARDLOCKUP_ENABLED
> - SOFT_WATCHDOG_ENABLED => WATCHDOG_SOFTOCKUP_ENABLED
> - watchdog_nmi_ => watchdog_hardlockup_
> - nmi_watchdog_available => watchdog_hardlockup_available
> - nmi_watchdog_user_enabled => watchdog_hardlockup_user_enabled
> - soft_watchdog_user_enabled => watchdog_softlockup_user_enabled
> - NMI_WATCHDOG_DEFAULT => WATCHDOG_HARDLOCKUP_DEFAULT
> 
> Then update a few comments near where names were changed.
> 
> This is specifically to make it less confusing when we want to
> introduce the buddy hardlockup detector, which isn't using NMIs. As
> part of this, we sanitized a few names for consistency.
> 
> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
> @@ -30,17 +30,17 @@
>  static DEFINE_MUTEX(watchdog_mutex);
>  
>  #if defined(CONFIG_HARDLOCKUP_DETECTOR) || defined(CONFIG_HAVE_NMI_WATCHDOG)
> -# define NMI_WATCHDOG_DEFAULT	1
> +# define WATCHDOG_HARDLOCKUP_DEFAULT	1
>  #else
> -# define NMI_WATCHDOG_DEFAULT	0
> +# define WATCHDOG_HARDLOCKUP_DEFAULT	0
>  #endif
>  
>  unsigned long __read_mostly watchdog_enabled;
>  int __read_mostly watchdog_user_enabled = 1;
> -int __read_mostly nmi_watchdog_user_enabled = NMI_WATCHDOG_DEFAULT;
> -int __read_mostly soft_watchdog_user_enabled = 1;
> +int __read_mostly watchdog_hardlockup_user_enabled = WATCHDOG_HARDLOCKUP_DEFAULT;
> +int __read_mostly watchdog_softlockup_user_enabled = 1;

I still see nmi_watchdog_user_enabled and soft_watchdog_user_enabled
in include/linux/nmi.h. They are declared there and also mentioned
in a comment.

It seems that they do not actually need to be declared there.
I guess that it was need for the /proc stuff. But it was
moved into kernel/watchdog.c by the commit commit dd0693fdf054f2ed37
("watchdog: move watchdog sysctl interface to watchdog.c").

>  int __read_mostly watchdog_thresh = 10;
> -static int __read_mostly nmi_watchdog_available;
> +static int __read_mostly watchdog_hardlockup_available;
>  
>  struct cpumask watchdog_cpumask __read_mostly;
>  unsigned long *watchdog_cpumask_bits = cpumask_bits(&watchdog_cpumask);

Otherwise, I like the changes.

With the following:

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index 83076bf70ce8..d14fe345eae9 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -17,8 +17,6 @@ void lockup_detector_soft_poweroff(void);
 void lockup_detector_cleanup(void);
 
 extern int watchdog_user_enabled;
-extern int nmi_watchdog_user_enabled;
-extern int soft_watchdog_user_enabled;
 extern int watchdog_thresh;
 extern unsigned long watchdog_enabled;
 
@@ -68,8 +66,8 @@ static inline void reset_hung_task_detector(void) { }
  * 'watchdog_enabled' variable. Each lockup detector has its dedicated bit -
  * bit 0 for the hard lockup detector and bit 1 for the soft lockup detector.
  *
- * 'watchdog_user_enabled', 'nmi_watchdog_user_enabled' and
- * 'soft_watchdog_user_enabled' are variables that are only used as an
+ * 'watchdog_user_enabled', 'watchdog_hardlockup_user_enabled' and
+ * 'watchdog_softlockup_user_enabled' are variables that are only used as an
  * 'interface' between the parameters in /proc/sys/kernel and the internal
  * state bits in 'watchdog_enabled'. The 'watchdog_thresh' variable is
  * handled differently because its value is not boolean, and the lockup

Reviewed-by: Petr Mladek <pmladek@suse.com>

Even better might be to remove the unused declaration in a separate
patch. I think that more declarations are not needed after moving
the /proc stuff into kernel/watchdog.c.

But it might also be fixed later.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
