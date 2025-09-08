Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9E3B48CE3
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  8 Sep 2025 14:09:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6mC9ezo3NAP6eXOc3iyeZ/C3kx+WAgN4Uo8s2xjcECU=; b=KV8Ydh5SJmMfeBDZnEfpIIaOSn
	5IqBLN3mXi84IUiR5NEGM/+Nxx3+J5VxjqAKHIzIBfLOgkT45jyvc1mNyWJ8WINIX3pKihCiqa1Kc
	iGENZ0l9xsTO+oQ+yEMLx0HdtuUKHN3sA5FphEDq5finmcnCsbSuDTZiEwVhlfLH+YVc=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uvagV-0004Vd-M4
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 08 Sep 2025 12:09:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1uvagT-0004VX-R8
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 08 Sep 2025 12:09:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bj4RYa63yog+buQ1zCGr7JNawWTRp4botS1M7B2K2Vs=; b=Js478IWykxS0J2D0iozJDKMh7E
 fBfB8zchqEIJtGhgXrh7o5cHN551dIz/BcFrCnPx5IVlruHNp1ScUUdPQmbWp4wllZsVzAlA/Cu/B
 zcOLXjmIJU+OtPzxtgxp7JZ3pjhapQv3FuXk00e8l/ZI2KG7PN1nRVtsq+YdVck6hH1M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Bj4RYa63yog+buQ1zCGr7JNawWTRp4botS1M7B2K2Vs=; b=FR6aGEsQHFZzeswru/b71PIfyc
 mlJ7laeyiJhDY63/ZSKafJJAkwGGkieXOJt6jraJvsvKbKbKBcs+IFi5QbiE42XT3TvipFF+Mk0q+
 Dx91I1LcLn974bQLVn0hi4NcGakAIGhh/VNW+0x5qPpF0ytqVhLbk7KwiGaQY/8G2koE=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uvagT-0007UN-8C for kgdb-bugreport@lists.sourceforge.net;
 Mon, 08 Sep 2025 12:09:21 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1757333349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Bj4RYa63yog+buQ1zCGr7JNawWTRp4botS1M7B2K2Vs=;
 b=aXIxN90AEh5CSoRHW5KSGj/MG67dqWG4pntFi+Z/cF2plG6ESffCsxgnu02x8qoAIwyFkn
 dkkffTGABDdPJCI8h/jwCcVfny5wD4Z627ivZG77g31eYQAQrDlk4cAX17WweBh/CwD0GL
 MBExR0oduVPOvCRaXg384PojFLfg/KSQAIn3dPq+pi2OiqU8c+beULBwKVhxKX547g8GMM
 50PSPtSYhTFppZB8aI98s/+VYUCqdKSLKIdPPeHBKEFADSQ+h9ZkBexpVbz2qLuPbWBuZW
 tFSqV5NexVIHeUqNrASk0waxyuDID/ap1bg7RyuawVs2mH+ooURhxg3UJ/84Ng==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1757333349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Bj4RYa63yog+buQ1zCGr7JNawWTRp4botS1M7B2K2Vs=;
 b=jh7b8LlcPKO6AYUugZ+dkgQ+L4SdirJvM1JbuW2a+8IZhjr0K1aZ8undcW7tlcfnID+1tI
 BQ/AMS3J1RJD21DQ==
To: Petr Mladek <pmladek@suse.com>, Marcos Paulo de Souza <mpdesouza@suse.com>
In-Reply-To: <aLsOBwV6CVBwG9JV@pathway.suse.cz>
References: <20250902-nbcon-kgdboc-v3-0-cd30a8106f1c@suse.com>
 <20250902-nbcon-kgdboc-v3-2-cd30a8106f1c@suse.com>
 <aLsOBwV6CVBwG9JV@pathway.suse.cz>
Date: Mon, 08 Sep 2025 14:15:08 +0206
Message-ID: <84ikht87tn.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025-09-05, Petr Mladek <pmladek@suse.com> wrote: > On
 Tue 2025-09-02 15:33:53, Marcos Paulo de Souza wrote: >> These helpers will
 be used when calling console->write_atomic on >> KDB code in the n [...] 
 Content analysis details:   (0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not exist)
X-Headers-End: 1uvagT-0007UN-8C
Subject: Re: [Kgdb-bugreport] [PATCH v3 2/4] printk: nbcon: Introduce KDB
 helpers
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Thompson <danielt@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 2025-09-05, Petr Mladek <pmladek@suse.com> wrote:
> On Tue 2025-09-02 15:33:53, Marcos Paulo de Souza wrote:
>> These helpers will be used when calling console->write_atomic on
>> KDB code in the next patch. It's basically the same implementaion
>> as nbcon_device_try_acquire, but using NBCON_PORIO_EMERGENCY when
>> acquiring the context.
>> 
>> For release we need to flush the console, since some messages could be
>> added before the context was acquired, as KDB emits the messages using
>> con->{write,write_atomic} instead of storing them on the ring buffer.
>
> I am a bit confused by the last paragraph. It is a very long sentence.
>
> Sigh, I wanted to propose a simple and clear alternative. But I ended
> in a rabbit hole and with a rather complex text:
>
> <proposal>
> The atomic flush in the release function is questionable. vkdb_printf()
> is primary called only when other CPUs are quiescent in kdb_main_loop()
> and do not call the classic printk(). But, for example, the
> write_atomic() callback might print debug messages. Or there is
> one kdb_printf() called in kgdb_panic() before other CPUs are
> quiescent. So the flush might be useful. Especially, when
> the kdb code fails to quiescent the CPUs and returns early.
>
> Let's keep it simple and just call __nbcon_atomic_flush_pending_con().
> It uses write_atomic() callback which is used by the locked kdb code
> anyway.
>
> The legacy loop (console_trylock()/console_unlock()) is not
> usable in kdb context.
>
> It might make sense to trigger the flush via the printk kthread.
> But it would not work in panic() where is the only known kdb_printf()
> called when other CPUs are not quiescent. So, it does not look
> worth it.
> </proposal>
>
> What do you think?
>
> My opinion:
>
> Honestly, I think that the flush is not much important because
> it will most offten have nothing to do.
>
> I am just not sure whether it is better to have it there
> or avoid it. It might be better to remove it after all.
> And just document the decision.

IMHO keeping the flush is fine. There are cases where there might be
something to print. And since a printing kthread will get no chance to
print as long as kdb is alive, we should have kdb flushing that
console.

Note that this is the only console that will actually see the new
messages immediately as all the other CPUs and quiesced. For this reason
we probably want to use __nbcon_atomic_flush_pending() to try to flush
_all_ the consoles.

As to the last paragraph of the commit message, I would keep it simple:

After release try to flush all consoles since there may be a backlog of
messages in the ringbuffer. The kthread console printers do not get a
chance to run while kdb is active.

John


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
