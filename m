Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D606EB4A43F
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  9 Sep 2025 09:53:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U+6hkqj+jfgILJc0mljbi0FjHv5dVmHXQPBQ5xXMrbU=; b=e8eJaKEig4y2fZvjuOjVyCXICP
	GkaK9fNTwCA7X4/hEyY12BFJJSFSGHv1S+NI/elij7O2LCOoMCGZleJZemmybP262A9wwynzlfmbs
	LSwLwPGzzx3qqJFO50KYyi3CLG13/SvodxRcyLTOUPo+/bhHV+nbOI8xJnt30VXCpSVI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uvtAP-0003gG-8t
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 09 Sep 2025 07:53:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1uvtAN-0003g9-Az
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 09 Sep 2025 07:53:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U/YV2Xs3MZWR9AfRGDhIN7j6fqwzuHQapoEFHafdQzc=; b=XCx3CrC4fHGmVM2s48RcfBTApO
 tqvvj4ihj2ytsqiTyPeA+bZfa2eAyodBhGa6O3+Kc3wB8w9XYUmRB0moEwQw8gpFZLkMrBLW2XY6K
 fanJVLNrPU6wVYyhO9Cfz0+eMgBNVhx3fB4BAblF53mq2/lhk1TdHDLcp/k0PrN8msrY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U/YV2Xs3MZWR9AfRGDhIN7j6fqwzuHQapoEFHafdQzc=; b=U3vgL7BEJNxOK9kGtLAsrxBRA1
 e6TfFoZcP2T3hreFJCQnMDEPgzog9PEIRGGwSUpSqWUGaXe1m4DRx49C8PRO3TNMG2rI3n5AYG9aZ
 3yfHSGI0BHokge/sp9j2i6OR1/zBDUERBWHNr9BPahlAjTUvMzCDxU52UJp/q2YwXYsw=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uvtAM-0002qH-Qz for kgdb-bugreport@lists.sourceforge.net;
 Tue, 09 Sep 2025 07:53:27 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1757404395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U/YV2Xs3MZWR9AfRGDhIN7j6fqwzuHQapoEFHafdQzc=;
 b=RAod9PKyn5r7N5VU7PHKl/DdKkCSqsRh9BjiNGRXJALPE5Fbq7ZoY6WsY0LUi/5x6BKekt
 fHzD8SPlyQOlAPfDqwcXklFGaAiapB+jhCEB7jk+yWIpBqp9Dza+Y0QklUBLgdDJmX5OJv
 DMCUT/fhISYcs2CV39g2A3y6onjyn9WvExmnBWOkNzzHXKALM9iFnUOO29dsY42TAigNXQ
 uNr7SDNSZZIoOg8V3XiKMjizA21kJzsQ6k2QiVPH1/EnGHhb0aZRfftqfEtQ7eclE9fqGn
 qWVdzaVxq2LMNrk1nGrzKJdthNAl8R5WmSQk3kZYitn5sZ0xGXdwwoxPrkKwFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1757404395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U/YV2Xs3MZWR9AfRGDhIN7j6fqwzuHQapoEFHafdQzc=;
 b=0JumJWy/2GJ+ND8AtHF1LAEJcfBl062EYNkFxgPGw6YgWvqgKpWDTSVq9M6Y3oqJZfP+oG
 RtrFQKyMERw2wuBg==
To: Petr Mladek <pmladek@suse.com>
In-Reply-To: <aL702dMFPy2bvfkp@pathway.suse.cz>
References: <20250902-nbcon-kgdboc-v3-0-cd30a8106f1c@suse.com>
 <20250902-nbcon-kgdboc-v3-3-cd30a8106f1c@suse.com>
 <84y0qtdk99.fsf@jogness.linutronix.de> <aL702dMFPy2bvfkp@pathway.suse.cz>
Date: Tue, 09 Sep 2025 09:59:14 +0206
Message-ID: <84wm68jc45.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025-09-08, Petr Mladek <pmladek@suse.com> wrote: > On
 Fri 2025-09-05 16:58:34, John Ogness wrote: >> On 2025-09-02, Marcos Paulo
 de Souza <mpdesouza@suse.com> wrote: >> > diff --git a/kernel/print [...]
 Content analysis details:   (0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not exist)
X-Headers-End: 1uvtAM-0002qH-Qz
Subject: Re: [Kgdb-bugreport] [PATCH v3 3/4] printk: nbcon: Allow KDB to
 acquire the NBCON context
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
 Marcos Paulo de Souza <mpdesouza@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Thompson <danielt@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 2025-09-08, Petr Mladek <pmladek@suse.com> wrote:
> On Fri 2025-09-05 16:58:34, John Ogness wrote:
>> On 2025-09-02, Marcos Paulo de Souza <mpdesouza@suse.com> wrote:
>> > diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
>> > index ff218e95a505fd10521c2c4dfb00ad5ec5773953..352235a0eb4a484caccf86d3a57d1a149218ecec 100644
>> > --- a/kernel/printk/nbcon.c
>> > +++ b/kernel/printk/nbcon.c
>> > @@ -255,6 +258,7 @@ static int nbcon_context_try_acquire_direct(struct nbcon_context *ctxt,
>> >  		 * interrupted by the panic CPU while printing.
>> >  		 */
>> >  		if (other_cpu_in_panic() &&
>> > +		    READ_ONCE(kdb_printf_cpu) != raw_smp_processor_id() &&
>> 
>> This needs some sort of ifdef CONFIG_KGDB_KDB wrapped around it. Maybe
>> it would be cleaner to have some macro.
>
> Great catch!
>
>> #ifdef CONFIG_KGDB_KDB
>> #define KGDB_IS_ACTIVE() (READ_ONCE(kdb_printf_cpu) == raw_smp_processor_id())
>> #else
>> #define KGDB_IS_ACTIVE() false
>> #endif
>
> I like this. It would fit into include/linux/kdb.h which already
> contains the #ifdef CONFIG_KGDB_KDB / #else / #endif sections.

BTW, if there is such a macro created, it should be KDB_IS_ACTIVE()
rather than KGDB_IS_ACTIVE().

John


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
