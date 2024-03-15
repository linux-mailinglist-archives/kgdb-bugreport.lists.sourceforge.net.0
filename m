Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E639787CB01
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 15 Mar 2024 11:00:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rl4MH-0005Z5-Am
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 15 Mar 2024 10:00:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liu.yeC@h3c.com>) id 1rl4ME-0005Yx-NS
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 15 Mar 2024 10:00:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/v8SprZqCNRj7ne2Yu30kI1h09rkuhN11RGZYRHLGfo=; b=ML/zgeBXqJb/0LJaz2Ni+Vp8H5
 mFRr4X2a3+rUrWQtddoY9Zw9kYbBEcXHAm5Nlfr7KhPPpVVWijNiJq23FY53GEQZkznQ0MmGTtPrS
 AFp9dHEWjKVtXvpuxVZf9inU9aOHaYrOF8NCf/Jhp7khUFn9RRgjtCpASZV1O3fTjWpQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/v8SprZqCNRj7ne2Yu30kI1h09rkuhN11RGZYRHLGfo=; b=PZXDHjQacs87uTrLBedCawiEEp
 mCLHrQhuFHxGpgrc+2RTPDtnP1GZI5UiBVfR7h7plvVjThWlTLCyqHJRZ8q1H6WF2bMUE+vle+vfe
 EZE8Pfz1lcuhF4tOaCGjyG1MmOAuz7V0SJUyyp0n40hJ+rcnjQQ5jCkJ0U0v7p7Ym0Ds=;
Received: from smtp.h3c.com ([60.191.123.50] helo=h3cspam02-ex.h3c.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rl4Lz-0005n4-SL for kgdb-bugreport@lists.sourceforge.net;
 Fri, 15 Mar 2024 10:00:11 +0000
Received: from mail.maildlp.com ([172.25.15.154])
 by h3cspam02-ex.h3c.com with ESMTP id 42F9x6i7048252;
 Fri, 15 Mar 2024 17:59:06 +0800 (GMT-8)
 (envelope-from liu.yeC@h3c.com)
Received: from DAG6EX08-BJD.srv.huawei-3com.com (unknown [10.153.34.10])
 by mail.maildlp.com (Postfix) with ESMTP id EB7F02329740;
 Fri, 15 Mar 2024 18:00:40 +0800 (CST)
Received: from DAG6EX02-IMDC.srv.huawei-3com.com (10.62.14.11) by
 DAG6EX08-BJD.srv.huawei-3com.com (10.153.34.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.27; Fri, 15 Mar 2024 17:59:08 +0800
Received: from DAG6EX02-IMDC.srv.huawei-3com.com ([fe80::4c21:7c89:4f9d:e4c4])
 by DAG6EX02-IMDC.srv.huawei-3com.com
 ([fe80::4c21:7c89:4f9d:e4c4%16]) with
 mapi id 15.02.1258.027; Fri, 15 Mar 2024 17:59:08 +0800
From: Liuye <liu.yeC@h3c.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Thread-Topic: =?gb2312?B?tPC4tDogtPC4tDogtPC4tDogtPC4tDogtPC4tDogW1BBVENIXSBrZGI6IEZp?=
 =?gb2312?Q?x_the_deadlock_issue_in_KDB_debugging.?=
Thread-Index: AQHaafG3YC/Li+j42kau1FDQhHr2m7EfIsgAgAMadaD///fWgIAJrHcQgAeL+QCAAIb8YP//gGOAgAGAGvCAAFNzgIABn6DQ///fkwAAPGYiUA==
Date: Fri, 15 Mar 2024 09:59:08 +0000
Message-ID: <ae45b2736f364629afe6806c354cec14@h3c.com>
References: <20240228120516.GA22898@aspen.lan>
 <8b41d34adaef4ddcacde2dd00d4e3541@h3c.com> <20240301105931.GB5795@aspen.lan>
 <2ea381e7407a49aaa0b08fa7d4ff62d3@h3c.com>
 <20240312095756.GB202685@aspen.lan>
 <06cfa3459ed848cf8f228997b983cf53@h3c.com>
 <20240312102419.GC202685@aspen.lan>
 <410a443612e8441cb729c640a0d606c6@h3c.com>
 <20240313141745.GD202685@aspen.lan>
 <56ed54fd241c462189d2d030ad51eac6@h3c.com>
 <20240314130916.GE202685@aspen.lan>
In-Reply-To: <20240314130916.GE202685@aspen.lan>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.114.188.68]
x-sender-location: DAG2
MIME-Version: 1.0
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: h3cspam02-ex.h3c.com 42F9x6i7048252
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  >On Thu, Mar 14, 2024 at 07:06:22AM +0000, Liuye wrote: >>
 >On Wed, Mar 13, 2024 at 01:22:17AM +0000, Liuye wrote: >> >> >On Tue, Mar
 12, 2024 at 10:04:54AM +0000, Liuye wrote: >> >> >> >On Tue, Mar 1 [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rl4Lz-0005n4-SL
Subject: [Kgdb-bugreport] =?gb2312?b?tPC4tDogtPC4tDogtPC4tDogtPC4tDogtPA=?=
 =?gb2312?b?uLQ6ILTwuLQ6IFtQQVRDSF0ga2RiOiBGaXggdGhlIGRlYWRsb2NrIGlzc3Vl?=
 =?gb2312?b?IGluIEtEQiBkZWJ1Z2dpbmcu?=
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
Cc: "kgdb-bugreport@lists.sourceforge.net"
 <kgdb-bugreport@lists.sourceforge.net>,
 "jason.wessel@windriver.com" <jason.wessel@windriver.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "jirislaby@kernel.org" <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

>On Thu, Mar 14, 2024 at 07:06:22AM +0000, Liuye wrote:
>> >On Wed, Mar 13, 2024 at 01:22:17AM +0000, Liuye wrote:
>> >> >On Tue, Mar 12, 2024 at 10:04:54AM +0000, Liuye wrote:
>> >> >> >On Tue, Mar 12, 2024 at 08:37:11AM +0000, Liuye wrote:
>> >> >> >> I know that you said schedule_work is not NMI save, which is 
>> >> >> >> the first issue. Perhaps it can be fixed using 
>> >> >> >> irq_work_queue. But even if irq_work_queue is used to 
>> >> >> >> implement it, there will still be a deadlock problem because 
>> >> >> >> slave cpu1 still has not released the running queue lock of 
>> >> >> >> master CPU0.
>> >> >> >
>> >> >> >This doesn't sound right to me. Why do you think CPU1 won't 
>> >> >> >release the run queue lock?
>> >> >>
>> >> >> In this example, CPU1 is waiting for CPU0 to release 
>> >> >> dbg_slave_lock.
>> >> >
>> >> >That shouldn't be a problem. CPU0 will have released that lock by 
>> >> >the time the irq work is dispatched.
>> >>
>> >> Release dbg_slave_lock in CPU0. Before that, shcedule_work needs to 
>> >> be handled, and we are back to the previous issue.
>> >
>> > Sorry but I still don't understand what problem you think can happen 
>> > here. What is wrong with calling schedule_work() from the IRQ work 
>> > handler?
>> >
>> > Both irq_work_queue() and schedule_work() are calls to queue 
>> > deferred work. It does not matter when the work is queued (providing 
>> > we are lock safe). What matters is when the work is actually executed.
>> >
>> > Please can you describe the problem you think exists based on when 
>> > the work is executed.
>>
>> CPU0 enters the KDB process when processing serial port interrupts and 
>> triggers an IPI (NMI) to other CPUs.  After entering a stable state,
>> CPU0 is in interrupt context, while other CPUs are in NMI context.
>> Before other CPUs enter NMI context, there is a chance to obtain the 
>> running queue of CPU0.
>
>Focusing on the run queue locks in this analysis is a mistake. Before the other CPUs enter NMI context there is a chance for them to obtain
>*any* locks, including the timer wheel locks.

Yes, you are right. I did not consider it comprehensively.

>> At this time, when CPU0 is processing kgdboc_restore_input, calling 
>> schedule_work, need_more_worker here determines the chance to wake up 
>> processes on system_wq.
>>
>> This will cause CPU0 to acquire the running queue lock of this core, 
>> which is held by other CPUs.  but other CPUs are still in NMI context 
>> and have not exited because waiting for CPU0 to release the 
>> dbg_slave_lock after schedule_work.
>>
>> After thinking about it, the problem is not whether schedule_work is 
>> NMI safe, but that processes on system_wq should not be awakened 
>> immediately when schedule_work is called.
>
>I disagree with this conclusion.
>
>The problem *is* that schedue_work() is not NMI-safe.
>
>You cannot solve an NMI safety problem by replacing schedule_work() with another function that is also not NMI-safe. That simply changes the locks that need to be taken to provoke a deadlock.
>
>
>> I replaced schedule_work with schedule_delayed_work, and this solved 
>> my problem.
>
>This may stop some specific reproduction from taking place but it does not fix the potential deadlock.
>
>I still believe that using irq_work is the only way to solve this properly. Please try the following change:

I tried the following patch and it also resolved the issue.
Thank you for your guidance and suggestions. I will organize this issue and resend a patch.

>diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c index 7ce7bb1640054..161b25ecc5e15 100644
>--- a/drivers/tty/serial/kgdboc.c
>+++ b/drivers/tty/serial/kgdboc.c
>@@ -22,6 +22,7 @@
> #include <linux/module.h>
> #include <linux/platform_device.h>
> #include <linux/serial_core.h>
>+#include <linux/irq_work.h>
>
> #define MAX_CONFIG_LEN		40
>
>@@ -99,10 +100,17 @@ static void kgdboc_restore_input_helper(struct work_struct *dummy)
>
> static DECLARE_WORK(kgdboc_restore_input_work, kgdboc_restore_input_helper);
>
>+static void kgdboc_queue_restore_input_helper(struct irq_work *unused) 
>+{
>+	schedule_work(&kgdboc_restore_input_work);
>+}
>+
>+static DEFINE_IRQ_WORK(kgdboc_restore_input_irq_work, 
>+kgdboc_queue_restore_input_helper);
>+
> static void kgdboc_restore_input(void)
> {
> 	if (likely(system_state == SYSTEM_RUNNING))
>-		schedule_work(&kgdboc_restore_input_work);
>+		irq_work_queue(&kgdboc_restore_input_irq_work);
> }
>
> static int kgdboc_register_kbd(char **cptr) @@ -133,6 +141,7 @@ static void kgdboc_unregister_kbd(void)
> 			i--;
> 		}
> 	}
>+	irq_work_sync(&kgdboc_restore_input_irq_work);
> 	flush_work(&kgdboc_restore_input_work);
> }
> #else /* ! CONFIG_KDB_KEYBOARD */

_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
