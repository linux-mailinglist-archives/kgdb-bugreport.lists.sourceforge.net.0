Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULsSGfdA32kxRAAAu9opvQ
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 15 Apr 2026 09:40:39 +0200
X-Original-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA16401743
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 15 Apr 2026 09:40:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LzS2VZR+hbMT5LogKDlnMyJ8vF3jqHF9FAWuiHABKyI=; b=JqXLnIORLOINyXBrBmnz4c7l5Z
	qtf+Tm9n8oHKC/MeKo6wQS+ZMrNzmA7POqda2oVzfvkV8Uz3EWpMCBfZiMtQqCDT+jLXe2wkPmbpU
	5jE4S+knfXdWMOMTV4IKf81MfG92Y4BNWQOZMqTLnddhs6LSEELwIULgXkoi00FaEHuE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1wCurV-0003wt-O2
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 15 Apr 2026 07:40:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+02be7307ed47794533ab+8270+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1wCurT-0003wm-QZ for kgdb-bugreport@lists.sourceforge.net;
 Wed, 15 Apr 2026 07:40:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NQ3FGyj3bB3s3TzgG2AxlTj+u1qB1K3Y0IxoIVLKrvk=; b=FFfGLkUQkYw5RZUVqIHYtE2P7z
 8FMkazE0UCQRlgqaKuQ5WhO7DDWcJwyjz+pTS10PXgUytJ+KChJZzIfRBu2gbx+H0+sY0OCVuU+Rj
 OkqCx1YShEn97geInS2cRmTz6qJ/5kMnRK+h1J8nE+DBdeK/3MsaKRACWdLs51TZ+aew=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NQ3FGyj3bB3s3TzgG2AxlTj+u1qB1K3Y0IxoIVLKrvk=; b=eWp09BqUX7ebJ7elCc1bpWu7GB
 m7bnASv0eK/crpqzNWULad/hZBnfmuns+eR9lJGYj29kyNjzoR6nfGT+mGABiWTTnJCCxeN0kZDhh
 j+gt7J5If00WEcjKR9+W0yDsPnuTD3w0j50xV9OoIqwLF7e5WJbOUOlgMpBinRX5VFxY=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wCurT-0000kV-Fe for kgdb-bugreport@lists.sourceforge.net;
 Wed, 15 Apr 2026 07:40:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=NQ3FGyj3bB3s3TzgG2AxlTj+u1qB1K3Y0IxoIVLKrvk=; b=GRC7t/3bI7JrNSLxeAMHgwX0K3
 xAtrXImzdHW7DjijCOvWl5uo9/a2L4na/HS9F/pxZocXEzRMU9/3W/DbnhQtfjmntUMumfaekHgVs
 JkymKksYscQDAWhsY7kaP5ZNlpkKxH790qgELBntdnQznef/Q7gbpvWEjZjYwEWaDeBReSTC31Vz9
 0/CNYrcSJDjOUbJO0e8rx/bKOLGKBkSTdCrQ4PvelVDl+p7o76807HnUjeXj973wAqCmNGzxM63WD
 75DdlQQAK05ZULtWENPz2ItUB2af6iD5mfwoGpmuXIYGFtnoqIRoCIa0Grmtn6PPrY8x33yj9B1cg
 ULLy052g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1wCur6-00000000k4p-0j2C;
 Wed, 15 Apr 2026 07:40:12 +0000
Date: Wed, 15 Apr 2026 00:40:12 -0700
From: Christoph Hellwig <hch@infradead.org>
To: chensong_2000@189.cn
Message-ID: <ad9A3JahjIcVkkQG@infradead.org>
References: <20260415070137.17860-1-chensong_2000@189.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260415070137.17860-1-chensong_2000@189.cn>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 15, 2026 at 03:01:37PM +0800,
 chensong_2000@189.cn
 wrote: > diff --git a/drivers/acpi/sleep.c b/drivers/acpi/sleep.c > index
 132a9df98471..b776dbd5a382 100644 > --- a/drivers/acpi/sleep.c [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wCurT-0000kV-Fe
Subject: Re: [Kgdb-bugreport] [RFC PATCH 1/2] kernel/notifier: replace
 single-linked list with double-linked list for reverse traversal
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
Cc: mark.rutland@arm.com, rafael@kernel.org, viresh.kumar@linaro.org,
 mturquette@baylibre.com, linux-kernel@vger.kernel.org, song@kernel.org,
 edumazet@google.com, da.gomez@kernel.org, live-patching@vger.kernel.org,
 mbenes@suse.cz, linux-clk@vger.kernel.org, agk@redhat.com,
 joe.lawrence@redhat.com, atomlin@atomlin.com, linux-acpi@vger.kernel.org,
 danielt@kernel.org, samitolvanen@google.com,
 kgdb-bugreport@lists.sourceforge.net, kuba@kernel.org, pabeni@redhat.com,
 linan122@huawei.com, lenb@kernel.org, dm-devel@lists.linux.dev,
 pmladek@suse.com, petr.pavlu@suse.com, paulmck@kernel.org,
 linux-pm@vger.kernel.org, frederic@kernel.org, jikos@kernel.org,
 snitzer@kernel.org, rostedt@goodmis.org, linux-raid@vger.kernel.org,
 mpatocka@redhat.com, yukuai@fnnas.com, jpoimboe@kernel.org, sboyd@kernel.org,
 netdev@vger.kernel.org, mcgrof@kernel.org, mhiramat@kernel.org,
 horms@kernel.org, jason.wessel@windriver.com, mathieu.desnoyers@efficios.com,
 bmarzins@redhat.com, linux-trace-kernel@vger.kernel.org, davem@davemloft.net,
 linux-modules@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[189.cn];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	RCPT_COUNT_TWELVE(0.00)[47];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@infradead.org,kgdb-bugreport-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[kgdb-bugreport];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[189.cn:email,infradead.org:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 0AA16401743
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 03:01:37PM +0800, chensong_2000@189.cn wrote:
> diff --git a/drivers/acpi/sleep.c b/drivers/acpi/sleep.c
> index 132a9df98471..b776dbd5a382 100644
> --- a/drivers/acpi/sleep.c
> +++ b/drivers/acpi/sleep.c
> @@ -56,7 +56,6 @@ static int tts_notify_reboot(struct notifier_block *this,
>  
>  static struct notifier_block tts_notifier = {
>  	.notifier_call	= tts_notify_reboot,
> -	.next		= NULL,
>  	.priority	= 0,

IFF this becomes important for some reason (and right now I don't see
it), please start by using proper wrappers for notifiers so that the
implementation details don't leak into the users.  That would actually
be useful on it's own even.



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
