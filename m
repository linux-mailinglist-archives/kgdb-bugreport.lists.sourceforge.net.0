Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAFC771EED
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Aug 2023 12:54:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qSxsm-0003Zn-ND
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 07 Aug 2023 10:54:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mark.rutland@arm.com>) id 1qSxsk-0003Zh-R1
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Aug 2023 10:54:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K0WflC4XsRDJ54USq4U9oWbHEokPWL9lx0QAUMwnJxM=; b=POLfqntcY9VOeQkd2fJnmeCgcf
 OTyU+UUD0u4VuKJW8Ax3tOTkkiATFd/Q1lRYBcN8n/2gTPz/JTWyNdimqiVyUxn2xokdWAct+o7uh
 GJJZyg9VougyXT58x4WCRO+9YGpueyKEsWUeJ93fjs8RS7qyT1RUF5iApJ9W7Tu04I+g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K0WflC4XsRDJ54USq4U9oWbHEokPWL9lx0QAUMwnJxM=; b=DW2R6X30z9mTC15/aWPqiawnPm
 V7qEsed+prgp3hm4Ipal+EN/7/HkVzP/kjdyyaSh8vl92vT1WID50lRiLuLvzJUq8nzqlUnNbzyVM
 UC1BFc9V5rhJffHlz/b6r2CbEMVwuZF3vdahwaToo5VAO3irku9RVoQAhtUAD3JwaE7w=;
Received: from foss.arm.com ([217.140.110.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1qSxsk-00FqfJ-G3 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Aug 2023 10:54:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 166FC1FB;
 Mon,  7 Aug 2023 03:55:16 -0700 (PDT)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com
 [10.1.32.139])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C1753F59C;
 Mon,  7 Aug 2023 03:54:30 -0700 (PDT)
Date: Mon, 7 Aug 2023 11:54:27 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Marc Zyngier <maz@kernel.org>
Message-ID: <ZNDNY_JfUxXm2vR5@FVFF77S0Q05N.cambridge.arm.com>
References: <20230601213440.2488667-1-dianders@chromium.org>
 <20230601143109.v9.7.I2ef26d1b3bfbed2d10a281942b0da7d9854de05e@changeid>
 <ZNDHZLGds0DTN6zg@FVFF77S0Q05N.cambridge.arm.com>
 <a030019c7c5887d54b97054ed7d9af12@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a030019c7c5887d54b97054ed7d9af12@kernel.org>
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 07, 2023 at 11:47:04AM +0100, Marc Zyngier wrote:
 > On 2023-08-07 11:28, Mark Rutland wrote: > > On Thu, Jun 01,
 2023 at 02:31:51PM
 -0700, Douglas Anderson wrote: > > > From: Sumit Garg <s [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [217.140.110.172 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1qSxsk-00FqfJ-G3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Aug 07, 2023 at 11:47:04AM +0100, Marc Zyngier wrote:
> On 2023-08-07 11:28, Mark Rutland wrote:
> > On Thu, Jun 01, 2023 at 02:31:51PM -0700, Douglas Anderson wrote:
> > > From: Sumit Garg <sumit.garg@linaro.org>
> > > 
> > > Let's use the debug IPI for rounding up CPUs in kgdb. When the debug
> > > IPI is backed by an NMI (or pseudo NMI) then this will let us debug
> > > even hard locked CPUs. When the debug IPI isn't backed by an NMI then
> > > this won't really have any huge benefit but it will still work.
> > > 
> > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > > 
> > > Changes in v9:
> > > - Remove fallback for when debug IPI isn't available.
> > > - Renamed "NMI IPI" to "debug IPI" since it might not be backed by
> > > NMI.
> > > 
> > >  arch/arm64/kernel/ipi_debug.c |  5 +++++
> > >  arch/arm64/kernel/kgdb.c      | 14 ++++++++++++++
> > >  2 files changed, 19 insertions(+)
> > 
> > This looks fine to me, but I'd feel a bit happier if we had separate
> > SGIs for
> > the backtrace and the KGDB callback as they're logically unrelated.
> 
> Well, we're a bit stuck here.
> 
> We have exactly *one* spare SGI with GICv3, as we lose 8 of them
> to the secure side. One possibility would be to mux some of the
> lesser used IPIs onto two SGIs (one with standard priority, and
> one with NMI priority).

Understood; Doug and I suggested two options for that:

1) Unify/mux the IPI_CPU_STOP and IPI_CPU_CRASH_STOP IPIs

   The only *intended* difference between the two is that IPI_CPU_CRASH_STOP
   calls crash_save_cpu() before trying to stop the CPU, but the
   implementations have diverged significantly for unrelated reasons.

2) Remove IPI_WAKEUP

   We only use IPI_WAKEUP for the ACPI parking protocol, and we could reuse
   another IPI (e.g. IPI_RESCHEDULE) to achieve the same thing witout a
   dedicated IPI.

Thanks,
Mark.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
