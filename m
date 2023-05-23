Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2160070DBB0
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 23 May 2023 13:46:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q1QSm-0001oH-Tb
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 23 May 2023 11:46:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1q1QSh-0001o6-A4
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 23 May 2023 11:45:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bwznIrELPYLWwydAYNIqJzHwi6mbsjXfEygWrt5kgFg=; b=DF7zoM4FX1L+NbMEBODmkQWk9K
 nerzPsjGKQVxCDsyQUoZn9N8TjGU+wv9BQPe/sSqmyzhenSu79iFBEZ2wizgOy+5uDa91yQWUjuuE
 7MgPIu1HYt3M7+Z6NzIERx0jBNVynh08bfwdMktL7ubkpK9A2358509GFrmGY7hZKT1A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bwznIrELPYLWwydAYNIqJzHwi6mbsjXfEygWrt5kgFg=; b=SjxHKLAGyTzBBOuPZsJqh3FHOy
 s5y5dz3nmX47p5wrRVcpRO8+n7UluQ+uzQQ6DsdrLpF7IAaunm4l6Tp9qiGlsGu+FtDgMj0Ajmw/n
 qYD5PKJvPHhF0jWTaHwT8WounQiyjDH+Qned390pVAIMBd7Np56d67/oVKAtHZrJOk9E=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q1QSd-000QN4-O9 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 23 May 2023 11:45:55 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 1B63120540;
 Tue, 23 May 2023 11:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1684842345; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bwznIrELPYLWwydAYNIqJzHwi6mbsjXfEygWrt5kgFg=;
 b=twQpZTwUAduFDvyrn/btduKthKphe6tUYKcM13EM9uQJnnGbA+/tzOdgNDG3JmL4BjSByc
 n4a8Ke1XYcAI2/M3x+kl4ijn9ob2921LsYwVdvz+1/kST+5Z4rr0578WynqlcrOsM335MR
 oM5DqKg8Dbes0acQZ55Wc7n8a3+jfXw=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id C81E62C141;
 Tue, 23 May 2023 11:45:40 +0000 (UTC)
Date: Tue, 23 May 2023 13:45:40 +0200
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <ZGynZJ6Kvf1w7Pyu@alley>
References: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
 <20230519101840.v5.8.Id4133d3183e798122dc3b6205e7852601f289071@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230519101840.v5.8.Id4133d3183e798122dc3b6205e7852601f289071@changeid>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2023-05-19 10:18:32, Douglas Anderson wrote: > The
 perf hardlockup detector works by looking at interrupt counts and > seeing
 if they change from run to run. The interrupt counts are > managed [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q1QSd-000QN4-O9
Subject: Re: [Kgdb-bugreport] [PATCH v5 08/18] watchdog/hardlockup: Move
 perf hardlockup checking/panic to common watchdog.c
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

On Fri 2023-05-19 10:18:32, Douglas Anderson wrote:
> The perf hardlockup detector works by looking at interrupt counts and
> seeing if they change from run to run. The interrupt counts are
> managed by the common watchdog code via its watchdog_timer_fn().
> 
> Currently the API between the perf detector and the common code is a
> function: is_hardlockup(). When the hard lockup detector sees that
> function return true then it handles printing out debug info and
> inducing a panic if necessary.
> 
> Let's change the API a little bit in preparation for the buddy
> hardlockup detector. The buddy hardlockup detector wants to print
> nearly the same debug info and have nearly the same panic
> behavior. That means we want to move all that code to the common
> file. For now, the code in the common file will only be there if the
> perf hardlockup detector is enabled, but eventually it will be
> selected by a common config.
> 
> Right now, this _just_ moves the code from the perf detector file to
> the common file and changes the names. It doesn't make the changes
> that the buddy hardlockup detector will need and doesn't do any style
> cleanups. A future patch will do cleanup to make it more obvious what
> changed.
> 
> With the above, we no longer have any callers of is_hardlockup()
> outside of the "watchdog.c" file, so we can remove it from the header,
> make it static, and move it to the same "#ifdef" block as our new
> watchdog_hardlockup_check(). While doing this, it can be noted that
> even if no hardlockup detectors were configured the existing code used
> to still have the code for counting/checking "hrtimer_interrupts" even
> if the perf hardlockup detector wasn't configured. We didn't need to
> do that, so move all the "hrtimer_interrupts" counting to only be
> there if the perf hardlockup detector is configured as well.
> 
> This change is expected to be a no-op.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
