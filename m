Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F7DA1C53E
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 25 Jan 2025 22:13:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tbnT9-0004kt-Sz
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 25 Jan 2025 21:13:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tbnT8-0004kn-Ix
 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 25 Jan 2025 21:13:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FwyhbgPJ8JVK3i3ZEhB4CskftyJ3ICKsi5da47uzo+4=; b=jrYLz/+IbhEIK6DzIk0N3mhh6s
 6bHPleC8p1lOzIcGSPLHsTdvGNnoiI6LsSuZy3H47+UKs8iNYp/IUQHfcUvZlLRPHNo08lRPazVcS
 +ymobeo7py6+1vJJikz1Tyc28GTHUtprm1N0Sa8vmo1hMGgBHnV7g/g8tJ/EtX5D3taU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=FwyhbgPJ8JVK3i3ZEhB4CskftyJ3ICKsi5da47uzo+4=; b=W
 kMh3bidoF8cWBrSCPuPGWieNh2TMDSPF61Q7a+2DVX4gom5uQSAoLqYgd3HmeDB0lQQtPymgD7ADh
 kf6MSHPsjCSsdbEC3pCuM6U8v5DImFU6K8Bd9iUhULnrOcOIHwcl4ROj/uMC8TD8XhIjhBgPoUinC
 WsBGlbezNvr7vq4w=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tbnT6-00039f-LL for kgdb-bugreport@lists.sourceforge.net;
 Sat, 25 Jan 2025 21:13:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=FwyhbgPJ8JVK3i3ZEhB4CskftyJ3ICKsi5da47uzo+4=; b=oLULmAlwdccNCf/zJbMbhAiN6A
 8cnN2CK+dZk1DRmvIVCdVAGiZz123NGyPdk65qDIYNt/eKQEeTqNECTxxRMplk81+ErZxy3CcmLRW
 1PYPpyK+Kn+GICdGF1BOr0DJDYj7vRV2X0rrrZZFHVhAN+p8WFHrDpcyGSOSElBfJAt8ckaMxfYF2
 0OwTh9h9ycxT5v+5osHJvbJgzRszO6SpA0kGnVzO7POt9hIfrm8VmgwYWbbKEG1huDj31qeJicLkv
 CS5BTZK/lIxtnFMDhhn1FypL+VinZ+5K8dk9bT2M23yl9QcjGoelmfa/L0oGTCRYDTJz8tprRSMlF
 wpE9tk8Q==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tbnSt-000000071c7-2RhY; Sat, 25 Jan 2025 21:13:15 +0000
Date: Sat, 25 Jan 2025 21:13:15 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Zhang Heng <zhangheng@kylinos.cn>,
 Douglas Anderson <dianders@chromium.org>,
 Daniel Thompson <danielt@kernel.org>
Message-ID: <Z5VT658i9S1lEZNe@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This is a bad patch. It looks like you should have used
 memcpy_from_page().
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1tbnT6-00039f-LL
Subject: [Kgdb-bugreport] kdb: use kmap_local_page()
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
Cc: kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

This is a bad patch.  It looks like you should have used
memcpy_from_page().



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
