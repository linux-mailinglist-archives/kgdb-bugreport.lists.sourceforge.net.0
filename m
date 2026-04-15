Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIt4DqZA32kxRAAAu9opvQ
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 15 Apr 2026 09:39:18 +0200
X-Original-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 63615401721
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 15 Apr 2026 09:39:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6392e2o54cCUn1zJWBY7lamFzTJcc2mg/j97y200+jM=; b=MtZkxfWFgPTDniXEih7LC3jlp3
	Q6sTN9mPDQWq0wb3np2dwSKzZvO1C9dm/gqsECAfiok9oSnvQp3aD826Y5gs4FmA7QrUh5jlyK4nf
	fr9EsJJqKDFQ/GbS0WxFAiZzNeOTaf8AYN/WBcs/g3xlYKlHQmg6Ueu/Z9V0U+odoSWs=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1wCuqA-0001RY-NA
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 15 Apr 2026 07:39:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+02be7307ed47794533ab+8270+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1wCuq9-0001RM-TA for kgdb-bugreport@lists.sourceforge.net;
 Wed, 15 Apr 2026 07:39:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=02523h4/XIkVhgJ/vZX6OsXKOEk8gdqo17d4C/+74kY=; b=eZX3bT3xLu2z5zCcz0VFqkfSnO
 eOqnpCAhW0mFUN0MwBop0RlA51ebb8pt22rE0ugJGrNi/d7JcZqG5xThKL1IiUFBqiayueDjsmMaR
 4tcchpF68h18m78x2TsNmFrOHmXOCyKkgQ9/geYtfV653N6VrqO1y68Lv/VYBt4jBGuY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=02523h4/XIkVhgJ/vZX6OsXKOEk8gdqo17d4C/+74kY=; b=C0Dm8X+i7jlpsGuvbHeOElw67M
 6ijj8hTlK0ArCeTfeiBsVv9KpeyU0TqCVUf+1ctfYJSFFxe/8aFM+gnZwfR3xr5sk/GtM3CvifD2F
 OBobQZKXFLa9uUIMKiK7DmTJm6+wwLL201gMKDFk3eZQS1XQOIR7kjY2F6arAbsQrcy0=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wCuq9-0000fr-JS for kgdb-bugreport@lists.sourceforge.net;
 Wed, 15 Apr 2026 07:39:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=02523h4/XIkVhgJ/vZX6OsXKOEk8gdqo17d4C/+74kY=; b=sfAIvHvJxJpthG3Xc2imVY/Hny
 3u+iheK16tltZrKVxY0W+Tqvi0LL6Wo2rGmYqg2NW7gFbWPrKjtlFkwux6bn2+pr3san/KDZLb4/L
 C6GtQrCUlMhNVTspr89p3YcZAtfJEN4hYMsJRuyiiVrnemtEm1lC6LY4wCWOqlqDCkqqANADpOqhM
 cxJH4fAp4cBQFZ/04Ft33u9X2TsbOruFO0jfu9hUnqCnkr1Ib+bnVz1bc020u+AqlHRT6lV+kPCTa
 KWM+LRMk+xz1Quqi0mss6p6k2rkspgW7gtGnhprWTZo2O+NY/r7uDgC89/KfdzRA0OUZ7foxyoJxg
 4UQgbT3A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1wCupi-00000000jwo-2mQw;
 Wed, 15 Apr 2026 07:38:46 +0000
Date: Wed, 15 Apr 2026 00:38:46 -0700
From: Christoph Hellwig <hch@infradead.org>
To: chensong_2000@189.cn
Message-ID: <ad9Ahq6BXQbHA1LS@infradead.org>
References: <20260413080140.180616-1-chensong_2000@189.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260413080140.180616-1-chensong_2000@189.cn>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Apr 13, 2026 at 04:01:40PM +0800,
 chensong_2000@189.cn
 wrote: > From: Song Chen <chensong_2000@189.cn> > > This patchset addresses
 a long-standing tight coupling between the > module loader an [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wCuq9-0000fr-JS
Subject: Re: [Kgdb-bugreport] [RFC PATCH 0/2] Decouple ftrace/livepatch from
 module loader via notifier priority and reverse traversal
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
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
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
X-Rspamd-Queue-Id: 63615401721
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 04:01:40PM +0800, chensong_2000@189.cn wrote:
> From: Song Chen <chensong_2000@189.cn>
> 
> This patchset addresses a long-standing tight coupling between the
> module loader and two of its key consumers: ftrace and livepatch.
> 
> Background:
> 
> The module loader currently hard-codes direct calls to
> ftrace_module_enable(), klp_module_coming(), klp_module_going() and
> ftrace_release_mod() inside prepare_coming_module() and the module
> unload path.

And that is bad why?

>  13 files changed, 290 insertions(+), 74 deletions(-)

This is a lot of new complex code touching a lot of places for no obvious
gain.  What is the reason for this series?  Does it prepare for something
else?



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
