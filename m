Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 319223E00EB
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  4 Aug 2021 14:12:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TKZ11OVgdBPzguwkZXli6CBgYtPYS2N70Bt5+CalpVg=; b=iLc31xwIvJ6fx7vovhZxs9thy
	HU9uf+hJYZT6mirG0bDMZnavBw8FWUijad/2sl/s5I+5x/MR120Nin3JqaKYvU/mHkGvZxeIPeLXO
	/97J26ORsdP1PaM+nJNO1KmSQl22AOcYPEq1oYFCxIWRm2KuUk2DVD/QWvq2ccsQqud1M=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1mBFlM-0004Fd-VJ
	for lists+kgdb-bugreport@lfdr.de; Wed, 04 Aug 2021 12:12:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pmladek@suse.com>) id 1mBFlL-0004FW-Dh
 for kgdb-bugreport@lists.sourceforge.net; Wed, 04 Aug 2021 12:12:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bn9YVbCSQKeHHPfP05oD5rwX8ODweOX9w/K+lArk/DE=; b=KQKk8UlueecplMZGNQ6VkgtoUY
 tUkqyhubZWHIsy+5wNxxu+3MlxxQG3s+jiF2nbBHBO4HbB37jlGRuFNdSkc/aWfjSmQ2icbLA0RQG
 elX8nA42g4Xthl+YDqc8yodAJJGRNBv2UXnbICDTW58fJTTzYXWuCHZPIgB05xVADgwU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bn9YVbCSQKeHHPfP05oD5rwX8ODweOX9w/K+lArk/DE=; b=PL0Ocw8P1WOIEHHlaiyCGsXV8k
 +yILgEstMlE+0uLqCEe/zsE6gyIkJCsidJ19cHwzvIUrwtkqlFlvvY+tHfXkeO9i07Y2cWfFoN53k
 l/Ez/vDNXTB5fLnVq3GqJ04qJbu99Ug8pYUSYz+7wujiCo5VtA9qMWl7QV1RySqdbbUY=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mBFlF-00C2MN-Qr
 for kgdb-bugreport@lists.sourceforge.net; Wed, 04 Aug 2021 12:12:43 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 296761FDD5;
 Wed,  4 Aug 2021 12:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1628079148; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bn9YVbCSQKeHHPfP05oD5rwX8ODweOX9w/K+lArk/DE=;
 b=pJykIc+xN1nPCYR+8lVCwGNHacbjeH4BnxYNPAjN5HwhwpgixEWNbXHGIVGxw0toxjfyE+
 3Cz/TV2a/vLe+bxLld3Yxu29dFROf4HRFFmsffjqCyRRUT/p7QefScdDc8u+qL9c428dDi
 8yrfvbcQ6E33HugPCEHnK31du1EvPTE=
Received: from suse.cz (unknown [10.100.216.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 18078A3B84;
 Wed,  4 Aug 2021 12:12:26 +0000 (UTC)
Date: Wed, 4 Aug 2021 14:12:22 +0200
To: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <YQqEJtmNFxVxH3U/@alley>
References: <20210803131301.5588-1-john.ogness@linutronix.de>
 <20210803131301.5588-4-john.ogness@linutronix.de>
 <20210803142558.cz7apumpgijs5y4y@maple.lan>
 <87tuk635rb.fsf@jogness.linutronix.de>
 <20210804113159.lsnoyylifg6v5i35@maple.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210804113159.lsnoyylifg6v5i35@maple.lan>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1mBFlF-00C2MN-Qr
Subject: Re: [Kgdb-bugreport] [PATCH printk v1 03/10] kgdb: delay roundup if
 holding printk cpulock
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Chengyang Fan <cy.fan@huawei.com>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Ingo Molnar <mingo@redhat.com>,
 kgdb-bugreport@lists.sourceforge.net, John Ogness <john.ogness@linutronix.de>,
 Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jason Wessel <jason.wessel@windriver.com>, linuxppc-dev@lists.ozlabs.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed 2021-08-04 12:31:59, Daniel Thompson wrote:
> On Tue, Aug 03, 2021 at 05:36:32PM +0206, John Ogness wrote:
> > On 2021-08-03, Daniel Thompson <daniel.thompson@linaro.org> wrote:
> > > On Tue, Aug 03, 2021 at 03:18:54PM +0206, John Ogness wrote:
> > >> kgdb makes use of its own cpulock (@dbg_master_lock, @kgdb_active)
> > >> during cpu roundup. This will conflict with the printk cpulock.
> > >
> > > When the full vision is realized what will be the purpose of the printk
> > > cpulock?
> > >
> > > I'm asking largely because it's current role is actively unhelpful
> > > w.r.t. kdb. It is possible that cautious use of in_dbg_master() might
> > > be a better (and safer) solution. However it sounds like there is a
> > > larger role planned for the printk cpulock...
> > 
> > The printk cpulock is used as a synchronization mechanism for
> > implementing atomic consoles, which need to be able to safely interrupt
> > the console write() activity at any time and immediately continue with
> > their own printing. The ultimate goal is to move all console printing
> > into per-console dedicated kthreads, so the primary function of the
> > printk cpulock is really to immediately _stop_ the CPU/kthread
> > performing write() in order to allow write_atomic() (from any context on
> > any CPU) to safely and reliably take over.
> 
> I see.
> 
> Is there any mileage in allowing in_dbg_master() to suppress taking
> the console lock?
> 
> There's a couple of reasons to worry about the current approach.
> 
> The first is that we don't want this code to trigger in the case when
> kgdb is enabled and kdb is not since it is only kdb (a self-hosted
> debugger) than uses the consoles. This case is relatively trivial to
> address since we can rename it kdb_roundup_delay() and alter the way it
> is conditionally compiled.
> 
> The second is more of a problem however. kdb will only call into the
> console code from the debug master. By default this is the CPU that
> takes the debug trap so initial prints will work fine. However it is
> possible to switch to a different master (so we can read per-CPU
> registers and things like that). This will result in one of the CPUs
> that did the IPI round up calling into console code and this is unsafe
> in that instance.
> 
> There are a couple of tricks we could adopt to work around this but
> given the slightly odd calling context for kdb (all CPUs quiesced, no
> log interleaving possible) it sounds like it would remain safe to
> bypass the lock if in_dbg_master() is true.
> 
> Bypassing an inconvenient lock might sound icky but:
> 
> 1. If the lock is not owned by any CPU then what kdb will do is safe.
>
> 2. If the lock is owned by any CPU then we have quiesced it anyway
>    and this makes is safe for the owning CPU to share its ownership
>    (since it isn't much different to recursive acquisition on a single
>    CPU)

I think about the following:

void kgdb_roundup_cpus(void)
{
	__printk_cpu_lock();
	__kgdb_roundup_cpus();
}

, where __printk_cpu_lock() waits/takes printk_cpu_lock()
	__kgdb_roundup_cpus() is the original kgdb_roundup_cpus();


The idea is that kgdb_roundup_cpus() caller takes the printk_cpu lock.
The owner will be well defined.

As a result any other CPU will not be able to take the printk_cpu lock
as long as it is owned by the kgdb lock. But as you say, kgdb will
make sure that everything is serialized at this stage. So that
the original raw_printk_cpu_lock_irqsave() might just disable
IRQs when called under debugger.

Does it make any sense?

I have to say that it is a bit hairy. But it looks slightly better
than the delayed/repeated IPI proposed by this patch.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
