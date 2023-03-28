Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8F06CC18E
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 28 Mar 2023 15:59:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ph9rJ-0001Jy-5h
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 28 Mar 2023 13:59:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1ph9rH-0001Js-NJ
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 28 Mar 2023 13:59:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AVBcqEYEGKTnf7WGbkGOAukA8G1Pz6BlAEfJJGZegkE=; b=Z72OvKHfHpmmhDZqbyJTSw2kma
 8mZRlB0OzCw7KBEqnpIn5kNo386JZFAKCJY8KoNb/7BSooYfIjXJtPEEE4q19dHDeCr3SQfKr5XaK
 +YnuzRJSFSfALfw03QDwOH6JpaQXzCT1J701RfBIlpVAJfeHBJ5Z5mxh+YCeTFu8OuuE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AVBcqEYEGKTnf7WGbkGOAukA8G1Pz6BlAEfJJGZegkE=; b=FA8nTRa5le3qrc56vEu1xXNYm4
 P3u4LTBs8mqQDVz5u3SZkP013TBZ/Yf+Eg59AhOGZngTe0X/KGGyxZGey3X761G+clbtSyEOD5ER/
 hAsl5KadpXwKQdA3izBdhfCDGCWsu6GAZH0LuW/32WykDy893VYENmf+McwoOqfEdqdk=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ph9rE-0000Xf-Pp for kgdb-bugreport@lists.sourceforge.net;
 Tue, 28 Mar 2023 13:59:32 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1680011957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AVBcqEYEGKTnf7WGbkGOAukA8G1Pz6BlAEfJJGZegkE=;
 b=Qr5nmE8Hzfwst5KZgNjYoFM8HsLQhJkEdDi1f8YG7E2l6RW3I42AYUnd3Hj1dvU5eX6ucE
 GVg+jehpW7GdmqKghuc5lozEBjGFsuvQffCAWB3VU0HXTrToz1MAwJdoVuMf2ANcPXbKco
 lhCcdky/Da1Db5huCooHTwdeTfILjgiUjH/GDxsXgH1xX15uImZ9mM3zJv67wmrm+jjGUG
 Q5lPW37rXRdSYabbj2GV/aaDAsbu2UylovBlnI13TApvcR01HhbVh7P9BjmMcZGUuzmuND
 cShYSAlNbZ04zECY/+957ip3qCIjIt1ZT6CJ0lscZ3Se7Zdb0ZYpmMJkoFl8Jg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1680011957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AVBcqEYEGKTnf7WGbkGOAukA8G1Pz6BlAEfJJGZegkE=;
 b=XlMGHhzSeLwTANt8K1piDZMwaiCTaHp3KPSQN9MATRV1Z9q5RIO3cVA0Gj8zfnAzt+Fsrk
 FK/+1PyuIPZ0BcBw==
To: Petr Mladek <pmladek@suse.com>
In-Reply-To: <ZCLsuln0nHr7S9a5@alley>
References: <20230302195618.156940-1-john.ogness@linutronix.de>
 <87wn3zsz5x.fsf@jogness.linutronix.de> <ZCLsuln0nHr7S9a5@alley>
Date: Tue, 28 Mar 2023 16:03:36 +0206
Message-ID: <87a5zxger3.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023-03-28, Petr Mladek <pmladek@suse.com> wrote: >> +
 if (!__serial8250_clear_IER(up, wctxt, &ier)) >> + return false; >> + >> +
 if (console_exit_unsafe(wctxt)) { >> + can_print = atomic_print_lin [...]
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
X-Headers-End: 1ph9rE-0000Xf-Pp
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
>> +	if (!__serial8250_clear_IER(up, wctxt, &ier))
>> +		return false;
>> +
>> +	if (console_exit_unsafe(wctxt)) {
>> +		can_print = atomic_print_line(up, wctxt);
>> +		if (!can_print)
>> +			atomic_console_reacquire(wctxt, &wctxt_init);
>
> I am trying to review the 9th patch adding console_can_proceed(),
> console_enter_unsafe(), console_exit_unsafe() API. And I wanted
> to see how the struct cons_write_context was actually used.

First off, I need to post the latest version of the 8250-POC patch. It
is not officially part of this series and is still going through changes
for the PREEMPT_RT tree. I will post the latest version directly after
answering this email.

> I am confused now. I do not understand the motivation for the extra
> @wctxt_init copy and atomic_console_reacquire().

If an atomic context loses ownership while doing certain activities, it
may need to re-acquire ownership in order to finish or cleanup what it
started.

> Why do we need a copy?

When ownership is lost, the context is cleared. In order to re-acquire,
an original copy of the context is needed. There is no technical reason
to clear the context, so maybe the context should not be cleared after a
takeover. Otherwise, many drivers will need to implement the "backup
copy" solution.

> And why we need to reacquire it?

In this particular case the context has disabled interrupts. No other
context will re-enable interrupts because the driver is implemented such
that the one who disables is the one who enables. So this context must
re-acquire ownership in order to re-enable interrupts.

> My feeling is that it is needed only to call
> console_exit_unsafe(wctxt) later. Or do I miss anything?

No. It is only about re-enabling interrupts. The concept of unsafe is
not really relevant if a hostile takeover during unsafe occurs. In that
case it becomes a "hope and pray" effort at the end of panic().

John


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
