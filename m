Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F58162D8F1
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 17 Nov 2022 12:08:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ovcl9-0002Ud-QB
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 17 Nov 2022 11:08:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1ovckw-0002UI-Uh
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 17 Nov 2022 11:08:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fM6pYfjkvRx7D7oK5QPuCSEfKgQ75z+OzhgRrY5Yew0=; b=Y5nt2TvuEeZJogJZYiWBL83Xm2
 TvrTwZ2MQe/LYDpSfozkJ0s+HWYg6lqJ4mtI63qXaTGtwhmL9H6k42u1Ayna7f/eC/KSaS3G+V17N
 XllmMV0W09ox7NKd94QgnC5XS/xNQeHKg5vpu2+cINeFOaOhVyhhj8/FAgU1BTsht1HM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fM6pYfjkvRx7D7oK5QPuCSEfKgQ75z+OzhgRrY5Yew0=; b=UnOx83EKHg/8DbieAk+O7HE/ds
 hPpWJWZbOFBeZiLNog2aMWF0uJL2pVX88CANDQ2EjD7T+ECsnrZwOMTh7LL4OswmU8SfbxipuK+mb
 LL1h+nqguRBgtsdn+USmjNL3nBG90qMHB7puymASHtHTsQt54vS8EgpaknPtk0LVLoDw=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ovcko-00BJOM-Pk for kgdb-bugreport@lists.sourceforge.net;
 Thu, 17 Nov 2022 11:08:26 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1668683293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fM6pYfjkvRx7D7oK5QPuCSEfKgQ75z+OzhgRrY5Yew0=;
 b=NHfM5e69zJKKBVggrBKMdzCfCQ/i0woaUHO1FuTmngDf6Enqb3JsIZ5OslxwnAjQaI5YnF
 2fyOkINghdiSpnDop2rk5F1FCadPVLEiYjRD9shRNBjzEBkQe3pKtMakInkjLEubdyfadX
 CKnygxiBuqGR+qkcO4YIDgFUo/67kb8yc+FazMktocPrN2HR65KngYoBpFmoKT4x3yLobC
 hlZAt0vuzLQw2tsfrQ+sHg+U4NwpsJBjSM8eWRaQfJqvD1TsbI5Gk/3Y+AxIjjAQeK1Wf6
 vG7s1rP4bMgrdVKNWHYnpfPlh1STzAphJo3fL84enaSIWWmhZpnfSENZNSXeZg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1668683293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fM6pYfjkvRx7D7oK5QPuCSEfKgQ75z+OzhgRrY5Yew0=;
 b=2VKA10Ovb0d8YDLPtBnjaYd9pwyjhK6e+g1zXJWgFLQB0TUpM7kQQM/siDEKLe9NLpdKQX
 1C2bbwpsn4uPCEAw==
To: Doug Anderson <dianders@chromium.org>
In-Reply-To: <CAD=FV=VouG3ihFCg4gC3dNFs7TqzpDgowHd38y8fR8qiTfRw_A@mail.gmail.com>
References: <20221116162152.193147-1-john.ogness@linutronix.de>
 <20221116162152.193147-39-john.ogness@linutronix.de>
 <CAD=FV=VouG3ihFCg4gC3dNFs7TqzpDgowHd38y8fR8qiTfRw_A@mail.gmail.com>
Date: Thu, 17 Nov 2022 12:14:09 +0106
Message-ID: <87mt8pon3a.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022-11-16, Doug Anderson <dianders@chromium.org> wrote:
 >> /* >> - * Hold the console_lock to guarantee that no consoles are >> +
 * Hold the console_list_lock to guarantee that no consoles are >> [...] 
 Content analysis details:   (-1.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [193.142.43.55 listed in list.dnswl.org]
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not
 exist)
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linutronix.de]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1ovcko-00BJOM-Pk
Subject: Re: [Kgdb-bugreport] [PATCH printk v5 38/40] tty: serial: kgdboc:
 use console_list_lock to trap exit
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
Cc: Petr Mladek <pmladek@suse.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 2022-11-16, Doug Anderson <dianders@chromium.org> wrote:
>>         /*
>> -        * Hold the console_lock to guarantee that no consoles are
>> +        * Hold the console_list_lock to guarantee that no consoles are
>>          * unregistered until the kgdboc_earlycon setup is complete.
>>          * Trapping the exit() callback relies on exit() not being
>>          * called until the trap is setup. This also allows safe
>>          * traversal of the console list and race-free reading of @flags.
>>          */
>> -       console_lock();
>> +       console_list_lock();
>>         for_each_console(con) {
>>                 if (con->write && con->read &&
>>                     (con->flags & (CON_BOOT | CON_ENABLED)) &&
>
> Officially don't we need both the list lock and normal lock here since
> we're reaching into the consoles?

AFAICT the only synchronization we need here is iterating the console
list, reading con->flags of a registered console, and modifying
con->exit of a registered console. The console_list_lock provides
synchronization for all of these things. By the end of this series the
console_lock does not provide synchronization for any of these things.

Is there something else that requires synchronization here?

After this series the console_lock is still responsible for:

- serializing console->write() callbacks
- stopping console->write() callbacks
- stopping console->device() callbacks
- synchronizing console->seq
- synchronizing console->dropped
- synchronizing the global @console_suspended
- providing various unclear protection for vt consoles
- some bizarre misuses in bcache

The scope may be larger than the above list. The investigation is still
ongoing.

John


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
