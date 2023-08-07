Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5160E771F4E
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Aug 2023 13:08:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qSy5x-0003nb-OH
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 07 Aug 2023 11:08:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <maz@kernel.org>) id 1qSy5v-0003nU-P0
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Aug 2023 11:08:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Message-ID:
 References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BSN44Z314FXh5F1aARKvod5eVSF2oyeFMWeobqxHtW4=; b=TsbELP4pNHxBLePD08jilWbGFS
 E3krpF19LCm833f/knaGLCwaCmTZtGtho2ZKX6rcmD6I7JSgZo1L1kUFPm8KXEPzYMj22rYjSpO32
 qm+s6xfhT48YpX1Gd9YWOX2/6d1DKy6bz80g7gJm66Re8e/fZSHWDMMlXu0y8/OZOKCk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BSN44Z314FXh5F1aARKvod5eVSF2oyeFMWeobqxHtW4=; b=dpunYeAPfh8oCiE95aW3180zRS
 EjfQB/p5H9SmGKLpt0hzEaPd5AdnZgSLvRWF6fCJf/XCrGmJstzI0bAtwucTd7AjL3/53TaDIDFb7
 pH+RjmWQ0cXzzqSmk8E+hWF/q6DUsy5GE2dDc641X5LI0gHqM3kYU+h28Fo0mtbTknvQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qSy5v-00FrKB-7W for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Aug 2023 11:08:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A1E62617CE;
 Mon,  7 Aug 2023 11:08:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC366C433C8;
 Mon,  7 Aug 2023 11:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691406489;
 bh=hdXUL/3D92Z9yQpqL5wt/vJLONqXakCcF546+DOh+4U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bqTc+RgIYDzXvN/ub1XcWMo75DJ473j6Le/czK/fcaloPVJ0mkaEJJsgVVKkZYoOL
 p6iSlOJxz1bloA/USJIUET+SyQ3pd049jLEnWIjHZzhQLwLWeBTw1MtQhS0tXGbGqL
 UF8KYn/EFViz3h/Kp6oa068ofm5bUsgq1QeIUMNen4Q6GmkHMz4A31vQgjgg8Ncyxh
 Qch7XTyieVT0fX3uZXiWqtP7owdtTa5zZBRBlIg76RJwYy0b5b/ba6AZGYrnfgf+Xd
 QkuhNkwf2sDNSwcgn2zFoveyBoCF2qNKxtfg3Hz77vsdrDUHWYfdAVv09u2hc618Vq
 gslGUGqmNFhCQ==
Received: from disco-boy.misterjones.org ([217.182.43.188] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <maz@kernel.org>) id 1qSy5m-002ncO-Bw;
 Mon, 07 Aug 2023 12:08:06 +0100
MIME-Version: 1.0
Date: Mon, 07 Aug 2023 12:08:06 +0100
From: Marc Zyngier <maz@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
In-Reply-To: <ZNDNY_JfUxXm2vR5@FVFF77S0Q05N.cambridge.arm.com>
References: <20230601213440.2488667-1-dianders@chromium.org>
 <20230601143109.v9.7.I2ef26d1b3bfbed2d10a281942b0da7d9854de05e@changeid>
 <ZNDHZLGds0DTN6zg@FVFF77S0Q05N.cambridge.arm.com>
 <a030019c7c5887d54b97054ed7d9af12@kernel.org>
 <ZNDNY_JfUxXm2vR5@FVFF77S0Q05N.cambridge.arm.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <7a295fcb4ff02542ff6835a77182fce8@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 217.182.43.188
X-SA-Exim-Rcpt-To: mark.rutland@arm.com, dianders@chromium.org,
 catalin.marinas@arm.com, will@kernel.org, sumit.garg@linaro.org,
 daniel.thompson@linaro.org, linux-perf-users@vger.kernel.org,
 ito-yuichi@fujitsu.com, wens@csie.org, ardb@kernel.org, swboyd@chromium.org,
 peterz@infradead.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org,
 kgdb-bugreport@lists.sourceforge.net, msys.mizuma@gmail.com,
 rafael.j.wysocki@intel.com, lecopzer.chen@mediatek.com, liwei391@huawei.com,
 linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023-08-07 11:54, Mark Rutland wrote: > On Mon, Aug 07,
 2023 at 11:47:04AM +0100, Marc Zyngier wrote: >> On 2023-08-07 11:28, Mark
 Rutland wrote: >> > On Thu, Jun 01, 2023 at 02:31:51PM -0700, Doug [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qSy5v-00FrKB-7W
Subject: Re: [Kgdb-bugreport] [PATCH v9 7/7] arm64: kgdb: Roundup cpus using
 the debug IPI
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 linux-kernel@vger.kernel.org, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, ito-yuichi@fujitsu.com,
 Stephen Boyd <swboyd@chromium.org>, linux-perf-users@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, kgdb-bugreport@lists.sourceforge.net,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Wei Li <liwei391@huawei.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 2023-08-07 11:54, Mark Rutland wrote:
> On Mon, Aug 07, 2023 at 11:47:04AM +0100, Marc Zyngier wrote:
>> On 2023-08-07 11:28, Mark Rutland wrote:
>> > On Thu, Jun 01, 2023 at 02:31:51PM -0700, Douglas Anderson wrote:
>> > > From: Sumit Garg <sumit.garg@linaro.org>
>> > >
>> > > Let's use the debug IPI for rounding up CPUs in kgdb. When the debug
>> > > IPI is backed by an NMI (or pseudo NMI) then this will let us debug
>> > > even hard locked CPUs. When the debug IPI isn't backed by an NMI then
>> > > this won't really have any huge benefit but it will still work.
>> > >
>> > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
>> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>> > > ---
>> > >
>> > > Changes in v9:
>> > > - Remove fallback for when debug IPI isn't available.
>> > > - Renamed "NMI IPI" to "debug IPI" since it might not be backed by
>> > > NMI.
>> > >
>> > >  arch/arm64/kernel/ipi_debug.c |  5 +++++
>> > >  arch/arm64/kernel/kgdb.c      | 14 ++++++++++++++
>> > >  2 files changed, 19 insertions(+)
>> >
>> > This looks fine to me, but I'd feel a bit happier if we had separate
>> > SGIs for
>> > the backtrace and the KGDB callback as they're logically unrelated.
>> 
>> Well, we're a bit stuck here.
>> 
>> We have exactly *one* spare SGI with GICv3, as we lose 8 of them
>> to the secure side. One possibility would be to mux some of the
>> lesser used IPIs onto two SGIs (one with standard priority, and
>> one with NMI priority).
> 
> Understood; Doug and I suggested two options for that:
> 
> 1) Unify/mux the IPI_CPU_STOP and IPI_CPU_CRASH_STOP IPIs
> 
>    The only *intended* difference between the two is that 
> IPI_CPU_CRASH_STOP
>    calls crash_save_cpu() before trying to stop the CPU, but the
>    implementations have diverged significantly for unrelated reasons.
> 
> 2) Remove IPI_WAKEUP
> 
>    We only use IPI_WAKEUP for the ACPI parking protocol, and we could 
> reuse
>    another IPI (e.g. IPI_RESCHEDULE) to achieve the same thing witout a
>    dedicated IPI.

Sure. My concern is that we're papering over the fundamental problem,
which is that IPIs are limited resource, and that we're bound to pile
more stuff on them.

I'm all for reclaiming the ones that can be merged, but we may 
ultimately
need a real fix for this.

         M.
-- 
Jazz is not dead. It just smells funny...


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
