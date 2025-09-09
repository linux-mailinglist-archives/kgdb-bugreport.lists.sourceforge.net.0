Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 034A7B4FFA6
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  9 Sep 2025 16:38:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k4UQ8eZbraM5vX4cby1ru9T+O8547ArVZnpophmf/Ww=; b=QKAmNUB55MqdVz9LFIzVjTt2/d
	uN8T/jBbmCGoSEKbkyMVIesiwuj1WgtAIQ2YxBp6rcTul/Zo9Py7MRYQda7JBHmh2XXHkG3r6Xx0v
	B8svCnepMbPtR2NdbbObEDqs/EM/FIwT5wX+3Vv/AGnYI1Xt6ujjH0I1VCrbZs9dTNEo=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uvzUl-0004DG-Sb
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 09 Sep 2025 14:38:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1uvzUj-0004D7-Nw
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 09 Sep 2025 14:38:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gua7LrpeR7bfs/7a6ZHZwdAWNdKrp1balt4Ii4jEoHk=; b=GtoG0xBZ+12yqLkN6ePCBU3DhD
 SlFvkUQsoJrsevwe1hKR+SUvXxDqj70eokjfohE8788Fzpw6Licnu+20WJ2qApl/myO6O/AflBUlX
 gQgSwvwjeN746Pkp+7fW5+xNS5hIMj84bDu2R6PVz8Gpx4pXP20MDCdUEAL4IXgwvMsk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gua7LrpeR7bfs/7a6ZHZwdAWNdKrp1balt4Ii4jEoHk=; b=S6DzdyHqgrMzIyfju4Pt500bPx
 Xldbl4zTslnjt+FvLXLHYwUBVa5oLQe57wfVrsOPrQnvub3P0KYSb8qaQfvs8/q/06vCqPXysnrRw
 Ox+HTaqihXoopUrvoU+LS54sak4zMB0HsWwXZU4R5K2Qy1foPu2dY8fPfjn8yF9YakYU=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uvzUj-0003r1-6d for kgdb-bugreport@lists.sourceforge.net;
 Tue, 09 Sep 2025 14:38:53 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1757428726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gua7LrpeR7bfs/7a6ZHZwdAWNdKrp1balt4Ii4jEoHk=;
 b=FEzTsEMBKXm1fbrbX+orrqrOGzM9ioIkjDlxsDbWjYdfTw7BjtnmJuNlH6TXpoVc2JLj6s
 eO8xBO9ysFDry9TydJAGijkYiKwnZPtuE3aieI7Y30IAn88aAmtIppBB2cmrJRoj3cRTBk
 el3p/v1xMeorYQ9WQ9yyDS+ngGfoqQJOebkIjYvc+jQ2Q5BSnHmByCBaUSZi5YxMOktlyx
 oe/FFPuLfAiflf8wdiS5oFlzykPNqgOaIEoYIxQyUarYTi60oYzDdDjLsRdpN9R1BjZR1t
 kkybf6UQ+kXiQjCkSgt4Y7xqcRQ2VVOUXb/nquz3XgoFNKAVyIfiTfgcH+EdFw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1757428726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gua7LrpeR7bfs/7a6ZHZwdAWNdKrp1balt4Ii4jEoHk=;
 b=MolD4iO/F/Lg+pMUeTUOs1CC3XuUTOR3ZwmM9BLPF5QKqUcuxjf2qptqh1IH6LvBxVcXqK
 gMY2EGfM+C3N8FBg==
To: Petr Mladek <pmladek@suse.com>
In-Reply-To: <aMA34mPqHFC3v3Kf@pathway.suse.cz>
References: <20250902-nbcon-kgdboc-v3-0-cd30a8106f1c@suse.com>
 <20250902-nbcon-kgdboc-v3-2-cd30a8106f1c@suse.com>
 <aLsOBwV6CVBwG9JV@pathway.suse.cz> <84ikht87tn.fsf@jogness.linutronix.de>
 <aMA34mPqHFC3v3Kf@pathway.suse.cz>
Date: Tue, 09 Sep 2025 16:44:45 +0206
Message-ID: <84ecsfk7wq.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025-09-09, Petr Mladek <pmladek@suse.com> wrote: >> >
 Honestly, I think that the flush is not much important because >> > it will
 most offten have nothing to do. >> > >> > I am just not sure wheth [...] 
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
X-Headers-End: 1uvzUj-0003r1-6d
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
 Marcos Paulo de Souza <mpdesouza@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Thompson <danielt@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 2025-09-09, Petr Mladek <pmladek@suse.com> wrote:
>> > Honestly, I think that the flush is not much important because
>> > it will most offten have nothing to do.
>> >
>> > I am just not sure whether it is better to have it there
>> > or avoid it. It might be better to remove it after all.
>> > And just document the decision.
>> 
>> IMHO keeping the flush is fine. There are cases where there might be
>> something to print. And since a printing kthread will get no chance to
>> print as long as kdb is alive, we should have kdb flushing that
>> console.
>> 
>> Note that this is the only console that will actually see the new
>> messages immediately as all the other CPUs and quiesced.
>
> I do not understand this argument. IMHO, this new
> try_acquire()/release() API should primary flush only
> the console which was (b)locked by this API.
>
> It will be called in kdb_msg_write() which tries to write
> to all registered consoles. So the other nbcon consoles will
> get flushed when the try_acquire() succeeds on them. And the
> legacy conosles were never flushed.

Right. I oversaw that it acquires each of the nbcon's.

> I would prefer to keep __nbcon_atomic_flush_pending_con().
> I mean to flush only the console which was blocked.

Agreed.

>> After release try to flush all consoles since there may be a backlog of
>> messages in the ringbuffer. The kthread console printers do not get a
>> chance to run while kdb is active.
>
> I like this text.

OK, but then change it to talk only about the one console.

After release try to flush the console since there may be a backlog of
messages in the ringbuffer. The kthread console printers do not get a
chance to run while kdb is active.

John


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
