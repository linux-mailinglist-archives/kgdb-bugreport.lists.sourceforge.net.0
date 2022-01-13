Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1288848D6A2
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 13 Jan 2022 12:24:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1n7yDV-0004kY-74
	for lists+kgdb-bugreport@lfdr.de; Thu, 13 Jan 2022 11:24:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sumit.garg@linaro.org>) id 1n7yDT-0004k7-3l
 for kgdb-bugreport@lists.sourceforge.net; Thu, 13 Jan 2022 11:24:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zQo5f2a0vJMYbwUquc/5FFtZJTgE6DYVku2GyGTB85E=; b=AW9m6d5v+YGxHMbsOwPzAyoTIP
 pHCsJDzKaQPAVW/fQ8DmWCbZ9nnW/NdhtuzCuihnjps4Vpo2StuW2KKQuNh0KPzSrvVcS2HeQILjx
 qXqPa7DBIPfrllxofvlLInJ8UPPVdc9JmtMaf5ZNcOHU3/7IEMmCrBA6xSPFXbeRuvEk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zQo5f2a0vJMYbwUquc/5FFtZJTgE6DYVku2GyGTB85E=; b=PTRzF0kt9EytXwuLCJDH7tUdjo
 03RFA7ZMq6JvVpechxh0mLk0fw2puK9/PKAL+UEwLjWpUisugt3PgLOpPPibueWosjqK8PIye0NiX
 CV2P1Juk7R8y/mjsrw2kd2gPkiXpKvCeKyu9ZVJx9I3o007YhLhXo5vKtHd+bNwGkbps=;
Received: from mail-lf1-f43.google.com ([209.85.167.43])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1n7yDO-00ESvd-EZ
 for kgdb-bugreport@lists.sourceforge.net; Thu, 13 Jan 2022 11:24:27 +0000
Received: by mail-lf1-f43.google.com with SMTP id x22so18221553lfd.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 13 Jan 2022 03:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zQo5f2a0vJMYbwUquc/5FFtZJTgE6DYVku2GyGTB85E=;
 b=mzsKRPNPWEUPFt1laFnO1Zx/KUb/OhDU9vaxvjEuBOe5jI7tkdKKY0ri52dLoksIB+
 264FKsaHHJq9gsG1k0jY6OQd1md0IrCBE/rcpEWZMpDAN02DD1jFAOrSF8I24pNEk1iE
 BQAoAq2vvNaPDphWkbIXfVXBxbNvhnz4d9oXtl621/IP5rRAy7X/T10hRWlSjVpJA6as
 YKplt9iwni3+VAv8i+Afb6is1T0pGtFjBcK8ti3rcmUGGAL6GJkPajQFjHTNYSiUgtvE
 0WptGprRPm7QUQqCyWtr2eEz0KWgltM9rKrxehdYcq22aFFTMRUFdNv9t4BY+op6McBe
 UpZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zQo5f2a0vJMYbwUquc/5FFtZJTgE6DYVku2GyGTB85E=;
 b=GxW89wV5FDgTj6CFEoBrb6rKT1DciCT1cuUyzsJJK4j+S1rYDG2lM/TiTfOhH9kRVa
 P+VwPsBxlcGrRTd8bSAavbTa+MUn9ZVYFakoE3x0qh8BudnnG9B3f3L30r8kmQMEFuFB
 PYPPlAPvkBTaPEMFwKBLwU9BvFreVvIYfFKLFymv+eX5f8hV+bfBslCP2cZoJjSNe9Tn
 FHSnfewwsY8KvoRIlgufNqJpDYf1HZrFMM29PmibOuKXREFyNvi+F9WdRXKZFkDRnH8H
 HnBXOyXbvL0xqSIIB1CLET5+aQERlCmQ6O+uhZ3I0QOVTAAZrwLYeKdeS25z4yXv9RsI
 kFRg==
X-Gm-Message-State: AOAM531r7dqHcXjPq2scrBeYEG2hazZM6C4JutUFHxTOnDDmMbyKJ2/p
 UX1g/NAKc/vK5pYTCWNwKrSMbI0wBJoaG5FXmd5ZSe1yaSNslg==
X-Google-Smtp-Source: ABdhPJwVmgTiOhL/7oC3HfT5WeS3u5pbrYvn8qUq7uEIQ0GnTeRCph+yYZ55j4T1zwlej7IGw+/e7IzccPBkKDAF0oE=
X-Received: by 2002:a05:6512:3298:: with SMTP id
 p24mr2888303lfe.513.1642071654205; 
 Thu, 13 Jan 2022 03:00:54 -0800 (PST)
MIME-Version: 1.0
References: <1604317487-14543-1-git-send-email-sumit.garg@linaro.org>
 <CAGb2v66mVoWiCibjq25d3Z8OvbWNO9p+vMo761RJLiD-BqVbqw@mail.gmail.com>
 <CAFA6WYN-wpQ86ik5FeAhimCcCoRAs9_g3BGL8CiSUmHxfeCSbg@mail.gmail.com>
 <Yd8sfP0IXN4KiLuP@gabell>
In-Reply-To: <Yd8sfP0IXN4KiLuP@gabell>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 13 Jan 2022 16:30:42 +0530
Message-ID: <CAFA6WYO0+LQ=mB1spCstt0cNZ0G+sZu_+Wrv6BKSeXqF5SRq4A@mail.gmail.com>
To: Masayoshi Mizuma <msys.mizuma@gmail.com>, Marc Zyngier <maz@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Masa, On Thu, 13 Jan 2022 at 01:01,
 Masayoshi Mizuma <msys.mizuma@gmail.com>
 wrote: > > On Wed, Jul 07, 2021 at 11:29:29AM +0530, Sumit Garg wrote: >
 > On Fri, 25 Jun 2021 at 20:26, Chen-Yu Tsai <wens@kerne [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.43 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.43 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1n7yDO-00ESvd-EZ
Subject: Re: [Kgdb-bugreport] [PATCH v7 0/7] arm64: Add framework to turn an
 IPI as NMI
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
Cc: x86@kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 tsbogend@alpha.franken.de, Jason Cooper <jason@lakedaemon.net>,
 mpe@ellerman.id.au, ito-yuichi@fujitsu.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 bp@alien8.de, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 wens@kernel.org, David Miller <davem@davemloft.net>,
 julien.thierry.kdev@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Masa,

On Thu, 13 Jan 2022 at 01:01, Masayoshi Mizuma <msys.mizuma@gmail.com> wrote:
>
> On Wed, Jul 07, 2021 at 11:29:29AM +0530, Sumit Garg wrote:
> > On Fri, 25 Jun 2021 at 20:26, Chen-Yu Tsai <wens@kernel.org> wrote:
> > >
> > > On Mon, Nov 2, 2020 at 7:46 PM Sumit Garg <sumit.garg@linaro.org> wrote:
> > > >
> > > > With pseudo NMIs support available its possible to configure SGIs to be
> > > > triggered as pseudo NMIs running in NMI context. And kernel features
> > > > such as:
> > > > - NMI backtrace can leverage IPI turned as NMI to get a backtrace of CPU
> > > >   stuck in hard lockup using magic SYSRQ.
> > > > - kgdb relies on NMI support to round up CPUs which are stuck in hard
> > > >   lockup state with interrupts disabled.
> > > >
> > > > This patch-set adds framework to turn an IPI as NMI which can be triggered
> > > > as a pseudo NMI which in turn invokes registered NMI handlers.
> > > >
> > > > After this patch-set we should be able to get a backtrace for a CPU
> > > > stuck in HARDLOCKUP. Have a look at an examples below from a hard lockup
> > > > testcase run on Developerbox:
> > > >
> > > > $ echo HARDLOCKUP > /sys/kernel/debug/provoke-crash/DIRECT
> > > >
> > > > NMI backtrace:
> > > > ==============
> > > >
> > > > # Issue Magic SysRq to dump backtrace
> > > >
> > > > [  376.894502] NMI backtrace for cpu 8
> > > > [  376.894506] CPU: 8 PID: 555 Comm: bash Not tainted 5.9.0-rc3-00740-g06ff047-dirty #242
> > > > [  376.894510] Hardware name: Socionext SynQuacer E-series DeveloperBox, BIOS build #73 Apr  6 2020
> > > > [  376.894514] pstate: 40000005 (nZcv daif -PAN -UAO BTYPE=--)
> > > > [  376.894517] pc : lkdtm_HARDLOCKUP+0x8/0x18
> > > > [  376.894520] lr : lkdtm_do_action+0x24/0x30
> > > > [  376.894524] sp : ffff800012cebd20
> > > > [  376.894527] pmr_save: 00000060
> > > > [  376.894530] x29: ffff800012cebd20 x28: ffff000875ae8000
> > > > [  376.894540] x27: 0000000000000000 x26: 0000000000000000
> > > > [  376.894550] x25: 000000000000001a x24: ffff800012cebe40
> > > > [  376.894560] x23: 000000000000000b x22: ffff800010fc5040
> > > > [  376.894569] x21: ffff000878b61000 x20: ffff8000113b2870
> > > > [  376.894579] x19: 000000000000001b x18: 0000000000000010
> > > > [  376.894588] x17: 0000000000000000 x16: 0000000000000000
> > > > [  376.894598] x15: ffff000875ae8470 x14: 00000000000002ad
> > > > [  376.894613] x13: 0000000000000000 x12: 0000000000000000
> > > > [  376.894622] x11: 0000000000000007 x10: 00000000000009c0
> > > > [  376.894631] x9 : ffff800012ceba80 x8 : ffff000875ae8a20
> > > > [  376.894641] x7 : ffff00087f6b3280 x6 : ffff00087f6b3200
> > > > [  376.894651] x5 : 0000000000000000 x4 : ffff00087f6a91f8
> > > > [  376.894660] x3 : ffff00087f6b0120 x2 : 1aa310cec69eb500
> > > > [  376.894670] x1 : 0000000000000000 x0 : 0000000000000060
> > > > [  376.894679] Call trace:
> > > > [  376.894683]  lkdtm_HARDLOCKUP+0x8/0x18
> > > > [  376.894686]  direct_entry+0x124/0x1c0
> > > > [  376.894689]  full_proxy_write+0x60/0xb0
> > > > [  376.894693]  vfs_write+0xf0/0x230
> > > > [  376.894696]  ksys_write+0x6c/0xf8
> > > > [  376.894699]  __arm64_sys_write+0x1c/0x28
> > > > [  376.894703]  el0_svc_common.constprop.0+0x74/0x1f0
> > > > [  376.894707]  do_el0_svc+0x24/0x90
> > > > [  376.894710]  el0_sync_handler+0x180/0x2f8
> > > > [  376.894713]  el0_sync+0x158/0x180
> > > >
> > > > KGDB:
> > > > =====
> > > >
> > > > # Enter kdb via Magic SysRq
> > > >
> > > > [6]kdb> btc
> > > > btc: cpu status: Currently on cpu 6
> > > > Available cpus: 0-5(I), 6, 7(I), 8, 9-23(I)
> > > > <snip>
> > > > Stack traceback for pid 555
> > > > 0xffff000875ae8000      555      554  1    8   R  0xffff000875ae89c0  bash
> > > > CPU: 8 PID: 555 Comm: bash Not tainted 5.9.0-rc3-00740-g06ff047-dirty #242
> > > > Hardware name: Socionext SynQuacer E-series DeveloperBox, BIOS build #73 Apr  6 2020
> > > > Call trace:
> > > >  dump_backtrace+0x0/0x1a0
> > > >  show_stack+0x18/0x28
> > > >  dump_stack+0xc0/0x11c
> > > >  kgdb_cpu_enter+0x648/0x660
> > > >  kgdb_nmicallback+0xa0/0xa8
> > > >  ipi_kgdb_nmicallback+0x24/0x30
> > > >  ipi_nmi_handler+0x48/0x60
> > > >  handle_percpu_devid_fasteoi_ipi+0x74/0x88
> > > >  generic_handle_irq+0x30/0x48
> > > >  handle_domain_nmi+0x48/0x80
> > > >  gic_handle_irq+0x18c/0x34c
> > > >  el1_irq+0xcc/0x180
> > > >  lkdtm_HARDLOCKUP+0x8/0x18
> > > >  direct_entry+0x124/0x1c0
> > > >  full_proxy_write+0x60/0xb0
> > > >  vfs_write+0xf0/0x230
> > > >  ksys_write+0x6c/0xf8
> > > >  __arm64_sys_write+0x1c/0x28
> > > >  el0_svc_common.constprop.0+0x74/0x1f0
> > > >  do_el0_svc+0x24/0x90
> > > >  el0_sync_handler+0x180/0x2f8
> > > >  el0_sync+0x158/0x180
> > > > <snip>
> > > >
> > > > Changes in v7:
> > > > - Add a new library function: kgdb_smp_call_nmi_hook() to expose fallback
> > > >   mechanism to arch specific code.
> > > > - Addressed other misc comments from Daniel.
> > > >
> > > > Changes in v6:
> > > > - Two new patches: #4 and #6 which adds runtime fallback framework for
> > > >   sysrq backtrace and kgdb roundup features.
> > > > - Reversed order of NMI backtrace and kgdb roundup feaure patches.
> > > > - Addressed other misc. comments from Marc.
> > > > - I haven't picked any tags from v5 since I think there is major rework
> > > >   involved. Masayoshi, could you please confirm if these features still
> > > >   work for you?
> > > >
> > > > Changes in v5:
> > > > - Rebased to head of upstream master.
> > > > - Remove redundant invocation of ipi_nmi_setup().
> > > > - Addressed misc. comments.
> > > >
> > > > Changes in v4:
> > > > - Move IPI NMI framework to a separate file.
> > > > - Get rid of hard-coded IPI_CALL_NMI_FUNC allocation.
> > > > - Add NMI backtrace support leveraged via magic SYSRQ.
> > > >
> > > > Changes in v3:
> > > > - Rebased to Marc's latest IPIs patch-set [1].
> > > >
> > > > [1] https://lkml.org/lkml/2020/9/1/603
> > > >
> > > > Changes since RFC version [1]:
> > > > - Switch to use generic interrupt framework to turn an IPI as NMI.
> > > > - Dependent on Marc's patch-set [2] which turns IPIs into normal
> > > >   interrupts.
> > > > - Addressed misc. comments from Doug on patch #4.
> > > > - Posted kgdb NMI printk() fixup separately which has evolved since
> > > >   to be solved using different approach via changing kgdb interception
> > > >   of printk() in common printk() code (see patch [3]).
> > > >
> > > > [1] https://lkml.org/lkml/2020/4/24/328
> > > > [2] https://lkml.org/lkml/2020/5/19/710
> > > > [3] https://lkml.org/lkml/2020/5/20/418
> > > >
> > > > Sumit Garg (7):
> > > >   arm64: Add framework to turn IPI as NMI
> > > >   irqchip/gic-v3: Enable support for SGIs to act as NMIs
> > > >   arm64: smp: Assign and setup an IPI as NMI
> > > >   nmi: backtrace: Allow runtime arch specific override
> > > >   arm64: ipi_nmi: Add support for NMI backtrace
> > > >   kgdb: Expose default CPUs roundup fallback mechanism
> > > >   arm64: kgdb: Roundup cpus using IPI as NMI
> > >
> > > Tested-by: Chen-Yu Tsai <wens@csie.org>
> > >
> > > on an ROC-RK3399-PC.
> >
> > Thanks for testing this feature.
> >
> > -Sumit
>
> Hello Sumit,
>
> How is this patch series going?

I am still awaiting feedback from arm64 maintainers.

arm64 maintainers,

Do you believe that features leveraging pseudo NMIs on arm64 can make
it to the mainline? Or the pseudo NMIs feature itself isn't mature
enough that we don't want to have any further users at this point?

-Sumit

>
> - Masa


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
