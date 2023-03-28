Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 436E66CCC43
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 28 Mar 2023 23:49:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1phHBk-0004bm-TV
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 28 Mar 2023 21:49:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1phHBi-0004bf-Sf
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 28 Mar 2023 21:49:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x82kiQTdgOmZzPuRLld3tUQlZDNUyZj9dPSJErAcQnY=; b=eiJQoI21bx+Usp2p81D5p6jaD7
 mYkoM/TScIpNs/F/DIYGi+3Gf0IzB0la4+5Irt1yPiA/e3HmH6TjYKkEGF12WQyN8nZxPtgFvfTA7
 DqCQDv/yke4s9uOnP24xA+oWi/pS9xzpkQdHmoqVe0R/y9uMtJOr6T6/UA//hAXh/d0M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x82kiQTdgOmZzPuRLld3tUQlZDNUyZj9dPSJErAcQnY=; b=SGvh568+7y+KFBcvDTsxINaGr9
 GHyNH6tXUFtAQXXxmAYabzXmG7kDtJ80mXll6c2pXX/whyG5X9XWvpc8l90QGPrd9msRrYrNhV+j9
 /362kdNSOXL5wJFzj3MKXBHYBbzLXFPucCNTOBVUM6B0JNhWacVUtD81o+earUl4ZDRk=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1phHBh-0006Dk-RL for kgdb-bugreport@lists.sourceforge.net;
 Tue, 28 Mar 2023 21:49:07 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1680040137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x82kiQTdgOmZzPuRLld3tUQlZDNUyZj9dPSJErAcQnY=;
 b=Gxt8IPQX5DvhqpfTMWR6evLosGpzTLD8Aocv8NcJKFX/u4L9B2hzd6YcJuBCHr+QjbT4xg
 GX/0rz8525+SYZfgXmzm/Xzs02lvGvSJ85FzFeniPf6KusZVT8r2T9kbNOaFEMdZDnTTGH
 pytZ3/OWIQOwfSIRVaqNZvh7BQXm4hZPqFzcNtEJJoyyeShYh2nE8Vw3AETRPJFbtKdg5Q
 j+jfbc+vp+bjP4KYRqtzpaP1hcYDPdIInJn4sh1KMxOh1CwbAzSonrYp9Pp2zKs17WEXSW
 sNJyHtdPGV2YgNvcugWzxBMBnzX1H3EGdS5oStfL1MCdTgAgte52XjW5edywKQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1680040137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x82kiQTdgOmZzPuRLld3tUQlZDNUyZj9dPSJErAcQnY=;
 b=9lZBip3wqG2//KEJ8BNUvFFe4hNUifeJzz8jtjLtaJPLUWTVjcc5ASPGsvxtvB6iBP8Vjc
 D5hsgEXZJLswIVDQ==
To: Petr Mladek <pmladek@suse.com>
In-Reply-To: <ZCMDVKy1Ir0rvi5g@alley>
References: <20230302195618.156940-1-john.ogness@linutronix.de>
 <87wn3zsz5x.fsf@jogness.linutronix.de> <ZCLsuln0nHr7S9a5@alley>
 <87a5zxger3.fsf@jogness.linutronix.de> <ZCMDVKy1Ir0rvi5g@alley>
Date: Tue, 28 Mar 2023 23:53:16 +0206
Message-ID: <87ilekmtuj.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023-03-28, Petr Mladek <pmladek@suse.com> wrote: >> If
 an atomic context loses ownership while doing certain activities, >> it may
 need to re-acquire ownership in order to finish or cleanup >> wha [...] 
 Content analysis details:   (-1.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not
 exist)
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [193.142.43.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1phHBh-0006Dk-RL
Subject: Re: [Kgdb-bugreport] locking API: was: [PATCH printk v1 00/18]
 serial: 8250: implement non-BKL console
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Neeraj Upadhyay <quic_neeraju@quicinc.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Aaron Tomlin <atomlin@redhat.com>, "Paul E.
 McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 David Gow <davidgow@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 rcu@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, tangmeng <tangmeng@uniontech.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 2023-03-28, Petr Mladek <pmladek@suse.com> wrote:
>> If an atomic context loses ownership while doing certain activities,
>> it may need to re-acquire ownership in order to finish or cleanup
>> what it started.
>
> This sounds suspicious. If a console/writer context has lost the lock
> then all shared/locked resources might already be used by the new
> owner.

Correct.

> I would expect that the context could touch only non-shared resources
> after loosing the lock.

Correct.

> If it re-acquires the lock then the shared resource might be in
> another state. So, doing any further changes might be dangerous.

That is the responsibility of the driver to implement it safely if it is
needed.

> I could imagine that incrementing/decrementing some counter might
> make sense but setting some value sounds strange.

The 8250 driver must disable interrupts before writing to the TX
FIFO. After writing it re-enables the interrupts. However, it might be
the case that the interrupts were already disabled, in which case after
writing they are left disabled.

IOW, whatever context disabled the interrupts is the context that is
expected to re-enable them. This simple rule makes it really easy to
handle nested printing because a context is only concerned with
restoring the IER state that it originally saw.

Using counters or passing around interrupt re-enabling responsibility
would be considerably trickier.

>>> And why we need to reacquire it?
>> 
>> In this particular case the context has disabled interrupts. No other
>> context will re-enable interrupts because the driver is implemented
>> such that the one who disables is the one who enables. So this
>> context must re-acquire ownership in order to re-enable interrupts.
>
> My understanding is that the driver might lose the lock only
> during hostile takeover. Is it safe to re-enable interrupts
> in this case?

Your understanding is incorrect. If a more important outputting context
should arrive, the non-important outputting context will happily and
kindly handover to the higher priority. From the perspective of the
atomic console driver, it lost ownership.

Simple example: The kthread printer is printing and some WARN_ON() is
triggered on another CPU. The warning will be output at a higher
priority and print from the context/CPU of the WARN_ON(). The kthread
printer will lose its ownership by handing over to the warning CPU.

Note that we are _not_ talking about when the unsafe bit is set. We are
talking about a printer that owns the console, is in a safe section, and
loses ownership. If that context was the one that disabled interrupts,
it needs to re-acquire the console in order to safely re-enable the
interrupts. The context that tookover ownership saw that interrupts are
disabled and does _not_ re-enable them when it is finished printing.

John


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
