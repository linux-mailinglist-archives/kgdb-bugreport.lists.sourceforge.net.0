Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7686B2270
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  9 Mar 2023 12:16:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1paEFc-0004gU-Ct
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 09 Mar 2023 11:16:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1paEFY-0004fm-7F
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 09 Mar 2023 11:15:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2T4EINMRBzFPJZwN9INT1SBZTuErj3LgYj+eGYMBez4=; b=JBczUjA1OiZGiNhMtsj9oEay9d
 mxHY5CJAX4icvhleaD6VilVWZ/fWT1bjEKg/3IiSXtCp9+rsGXSU+I3Cc23UMHNgbU2hJP+jJAaBe
 tMU7LvV0zcTmN3VTpWP0R5tSCAHUn1B925FtdHCvI3xB19ddMQxtcKmK3A/IHZxjIPDc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2T4EINMRBzFPJZwN9INT1SBZTuErj3LgYj+eGYMBez4=; b=Wrnv6AJ3zyFVcbp3sFACNhdYls
 N6WXE3SpEBpOKe2Tx2U3Ts6KgRE31jlahHcHRIstO59a4Sp4V2ogTAOxUMR3KpTyxwimSSlySJZEr
 3jodEf8j1PesrtkHZOsUZnLk9glmS07SkzdAxeO9DH83EcmDLmMWzwia+PaBYofP2goI=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1paEFW-002BpI-6K for kgdb-bugreport@lists.sourceforge.net;
 Thu, 09 Mar 2023 11:15:56 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1678360541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2T4EINMRBzFPJZwN9INT1SBZTuErj3LgYj+eGYMBez4=;
 b=xNpDjRXQV0w7qPgya0qSCdZnSvmsrN5+D9NiSJ8W7hjH5L2FSA+U6IN9eEzcQZC7D8T5lK
 2jeIPTwQzAHtm0mgcdkiISsF3TMELVZouR90SaoeddVA7rD+nBl1Z0lA+12sWh1A2ucRU1
 9sxYh/OHiJAJlhMeuJD+eYFjCeJ1sTt9eC4EG20MN2VRK+BUEanoTkJG8xJ20C8lrw4Pr0
 p7cCxe6KQxTE5s8/VBhqxDM0RqsHWGiTHIp6DEifweeAWTXFMLZJ3fFpnyf5rYYb4WHYgR
 EJDMharKYDDXgTsngzUBYpmLZPQpA0qy+wRSVyiQAu1zdkjZtw/nBGLFfbAKxg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1678360541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2T4EINMRBzFPJZwN9INT1SBZTuErj3LgYj+eGYMBez4=;
 b=VShMsCoDjVA3oby2Q1oOFnBZanLOGCI+zDVwjZ9sjp/xVkU1xQZ/INoTHMFZ2j56lye20h
 QlIUhfmOf6szpdDg==
To: Daniel Thompson <daniel.thompson@linaro.org>
In-Reply-To: <20230309105539.GA83145@aspen.lan>
References: <20230302195618.156940-1-john.ogness@linutronix.de>
 <20230309105539.GA83145@aspen.lan>
Date: Thu, 09 Mar 2023 12:20:13 +0106
Message-ID: <87a60mjhx6.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023-03-09, Daniel Thompson <daniel.thompson@linaro.org>
 wrote: > So I grabbed the whole series and pointed it at the kgdb test suite.
 > > Don't get too excited about that (the test suite only exer [...] 
 Content analysis details:   (-1.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not
 exist)
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [193.142.43.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1paEFW-002BpI-6K
Subject: Re: [Kgdb-bugreport] [PATCH printk v1 00/18] threaded/atomic
 console support
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
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Aaron Tomlin <atomlin@redhat.com>, Petr Mladek <pmladek@suse.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>,
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

On 2023-03-09, Daniel Thompson <daniel.thompson@linaro.org> wrote:
> So I grabbed the whole series and pointed it at the kgdb test suite.
>
> Don't get too excited about that (the test suite only exercises 8250
> and PL011... and IIUC little in the set should impact UART polling
> anyway) but FWIW:
>
> Tested-by: Daniel Thompson <daniel.thompson@linaro.org>

One of the claims of this series is that it does not break any existing
drivers/infrastructure. So any successful test results are certainly of
value.

John


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
