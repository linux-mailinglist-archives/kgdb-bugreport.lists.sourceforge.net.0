Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGTQJHLTfGlbOwIAu9opvQ
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 30 Jan 2026 16:51:14 +0100
X-Original-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E73EFBC3BA
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 30 Jan 2026 16:51:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pG86/jI3Rdyw1VlF+/j/lZUPrTWnvDABejhxKD0gYOI=; b=PhxE0Qb6TJYJ3cbKnxOpjEeQqK
	Rx/Hij74cz3Pi9vJnZQy2PbXNyXsCnEB0zABqs5Ir8f0ahOcUtHm3Oi4Z2S6x2Nk+cD246PDc6FGE
	GhVpG4L1UV96dDuuddsWQpYueFarGJdMhiDH5tzs7fWbIhZQ6PT68hw3u2H8xI08YHFA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1vlqm7-0007CP-Pr
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 30 Jan 2026 15:51:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1vlqm6-0007CH-Pf
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 30 Jan 2026 15:51:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vOa37cugu1e7NFG01Hi5lQxNeOFAbNhgF4zlCMpuWB0=; b=bZHx1HtL9D9hQJiqLT5Bye2ozI
 1MorRafX8Jan7U+PcYevs7/uk1txUR7t4jr6ZLhgE3mmBh2Qz+iLvcZUzT75UMX6Xu5UcfGcFyo3Z
 eUtRbpfYVWeAmTWsxd5YvgBkUgNLgWt/w80UK5P1nvXcWr4DhYN2BEvr1WbIODemjNlU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vOa37cugu1e7NFG01Hi5lQxNeOFAbNhgF4zlCMpuWB0=; b=KEB6HgpugseOb+VMJlTGyYtgOS
 X7nabaIUPZxfT9iMyAVDkEgnbMjVIq91brJi0PFmmlTLGriG++uuvMNJVBgJqgj01XCbCGPr8ynpp
 QK1JXX/kfDEWqWtTK4/6U68UZcyKEzWs395/UuybGMUuclZIVPtSQcXa8iOQrIFF12Kg=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vlqm6-0001Gv-7x for kgdb-bugreport@lists.sourceforge.net;
 Fri, 30 Jan 2026 15:51:11 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1769787091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vOa37cugu1e7NFG01Hi5lQxNeOFAbNhgF4zlCMpuWB0=;
 b=0KQp0ypVQ4kZaeO3mPHMfxJV+hK/54vG6DKBi+oQw7b2zUOdcXSHVjzGTkDhg+DII5BPUq
 aN49RxuHT0Y324cEPE9hahaKdLHrEB12udzdH1NvAbslSIBaR+apFss0VpjAJQGlvJvNWz
 Qkt0FDwz1uMiX4gq49nlr83YKlkc4clstGJ1Gn1qJZPTuOUjrQYGQ2og6q2aakCd23E2bK
 j7QeXx4RcIyDXczvYB5hGiBrowZd2spJR3vfcC58o7tRoab9LXrUZs+RPcCpb6cx/pdJtb
 HBe2qGa1jRaFKPPNxGpTtUqYNPr0BFkp5fHngur0T+mOUqFJcq3Nhz3k8u/Dpw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1769787091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vOa37cugu1e7NFG01Hi5lQxNeOFAbNhgF4zlCMpuWB0=;
 b=tRQx2QeqDh72ig5xLjiaegMLqnl9AhaSG7GZod8dlzScFDOmHttRC8Fl88vJKoOCPg8W40
 GHTlrnG5vPdq05BA==
To: Petr Mladek <pmladek@suse.com>, Marcos Paulo de Souza <mpdesouza@suse.com>
In-Reply-To: <aWZyEHsOJFLRLRKT@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-1-21a291bcf197@suse.com>
 <aWZyEHsOJFLRLRKT@pathway.suse.cz>
Date: Fri, 30 Jan 2026 16:37:30 +0106
Message-ID: <878qdf3ynh.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026-01-13, Petr Mladek <pmladek@suse.com> wrote: > On
 Sat 2025-12-27 09:16:08, Marcos Paulo de Souza wrote: >> The current usage
 of console_is_usable() is clumsy. The parameter >> @use_atomic is b [...]
 Content analysis details:   (0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not exist)
X-Headers-End: 1vlqm6-0001Gv-7x
Subject: Re: [Kgdb-bugreport] [PATCH 01/19] printk/nbcon: Use an enum to
 specify the required callback in console_is_usable()
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
Cc: Andreas Larsson <andreas@gaisler.com>, Kees Cook <kees@kernel.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Shan-Chun Hung <schung@nuvoton.com>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, linux-hardening@vger.kernel.org,
 Breno Leitao <leitao@debian.org>, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, sparclinux@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Richard Weinberger <richard@nod.at>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-serial@vger.kernel.org,
 Daniel Thompson <danielt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jacky Huang <ychuang3@nuvoton.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jason Wessel <jason.wessel@windriver.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, linux-m68k@lists.linux-m68k.org,
 Nicholas Piggin <npiggin@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-fsdevel@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linutronix.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[44];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,linutronix.de:s=2020,linutronix.de:s=2020e];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,linutronix.de:-];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[john.ogness@linutronix.de,kgdb-bugreport-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gaisler.com,kernel.org,lists.sourceforge.net,foss.st.com,vger.kernel.org,nuvoton.com,google.com,debian.org,st-md-mailman.stormreply.com,cambridgegreys.com,linux.ibm.com,lunn.ch,nod.at,csgroup.eu,linux.intel.com,linux-m68k.org,redhat.com,chromium.org,windriver.com,lists.infradead.org,goodmis.org,lists.linux-m68k.org,gmail.com,nxp.com,intel.com,linuxfoundation.org,igalia.com,ellerman.id.au,sipsolutions.net,lists.ozlabs.org,davemloft.net];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[kgdb-bugreport,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,jogness.linutronix.de:mid,linutronix.de:email]
X-Rspamd-Queue-Id: E73EFBC3BA
X-Rspamd-Action: no action

On 2026-01-13, Petr Mladek <pmladek@suse.com> wrote:
> On Sat 2025-12-27 09:16:08, Marcos Paulo de Souza wrote:
>> The current usage of console_is_usable() is clumsy. The parameter
>> @use_atomic is boolean and thus not self-explanatory. The function is
>> called twice in situations when there are no-strict requirements.
>> 
>> Replace it with enum nbcon_write_cb which provides a more descriptive
>> values for all 3 situations: atomic, thread or any.
>> 
>> Note that console_is_usable() checks only NBCON_USE_ATOMIC because
>> .write_thread() callback is mandatory. But the other two values still
>> make sense because they describe the intention of the caller.
>> 
>> --- a/include/linux/console.h
>> +++ b/include/linux/console.h
>> @@ -202,6 +202,19 @@ enum cons_flags {
>>  	CON_NBCON_ATOMIC_UNSAFE	= BIT(9),
>>  };
>>  
>> +/**
>> + * enum nbcon_write_cb - Defines which nbcon write() callback must be used based
>> + *                       on the caller context.
>> + * @NBCON_USE_ATOMIC: Use con->write_atomic().
>> + * @NBCON_USE_THREAD: Use con->write_thread().
>> + * @NBCON_USE_ANY:    The caller does not have any strict requirements.
>> + */
>> +enum nbcon_write_cb {
>> +	NBCON_USE_ATOMIC,
>> +	NBCON_USE_THREAD,
>> +	NBCON_USE_ANY,
>
> AFAIK, this would define NBCON_USE_ATOMIC as zero. See below.

Yes, although the start value is not guaranteed. And anyway if is to be
used as bits, it should be explicitly set so (such as with enum
cons_flags).

But in reality, we only care about NBCON_USE_ATOMIC and
!NBCON_USE_ATOMIC, so I agree with your comments below about keeping it
a simple enum and not caring about the numerical value.

>> @@ -631,7 +645,7 @@ static inline bool console_is_usable(struct console *con, short flags, bool use_
>>  		return false;
>>  
>>  	if (flags & CON_NBCON) {
>> -		if (use_atomic) {
>> +		if (nwc & NBCON_USE_ATOMIC) {
>
> Let's keep it defined by as zero and use here:
>
> 		if (nwc == NBCON_USE_ATOMIC) {
>
> Note that we do _not_ want to return "false" for "NBCON_USE_ANY"
> when con->write_atomic does not exist.

I agree.

If changed to "nwc == NBCON_USE_ATOMIC":

Reviewed-by: John Ogness <john.ogness@linutronix.de>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
