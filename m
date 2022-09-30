Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B575F04D9
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 30 Sep 2022 08:34:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1oe9bT-00027X-7H
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 30 Sep 2022 06:34:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <arden.jay@gmail.com>) id 1oe9bA-00026v-HG
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 30 Sep 2022 06:34:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q+FQpamSz/Of9ZYeTSRd7EN6g7e6t75cbQPLDwZP51E=; b=OgXGp1PMannX0DnerPlvusxs4e
 mitUYJKaJDdMNjL/t2TSa6XkxJCPEyC3wWbTJLo3iCVCR/Yuuwt8sKmP0zsRx8ECOTqdd0NFlyAY0
 ymQFZ1bL03HYK+IgP31Emu9JfOn2ZRJ3TGPQWQEmf6m0mzr+dq35zuHC8xXcuQItw4qQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=q+FQpamSz/Of9ZYeTSRd7EN6g7e6t75cbQPLDwZP51E=; b=k
 ovLjJeM5H6scrxk2kgsboBGjXXYs4PZzmCFyS61mzNRn9zd+z/b+ruL2XWnO89+xu7Ql9vg8rFvyl
 xfHZWtZtg0ZA6T/VE2WwQsVu5bSJuC16kGyxy0wxa5+w7pB72tASs35Zy+e8LJsJeAJ+pgBVyCGMT
 9jzj3kfG9qjYT6Mw=;
Received: from mail-pl1-f182.google.com ([209.85.214.182])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oe9az-007Ybu-Cq for kgdb-bugreport@lists.sourceforge.net;
 Fri, 30 Sep 2022 06:34:01 +0000
Received: by mail-pl1-f182.google.com with SMTP id w20so3143132ply.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 29 Sep 2022 23:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date; bh=q+FQpamSz/Of9ZYeTSRd7EN6g7e6t75cbQPLDwZP51E=;
 b=akCwhC8DSjvjrKoRY3XIicI3//WE9VeuVUonf7PMYmTemWLjD3Wem1aiJ80q5L+1ux
 IB7BT6eeiUzXV4gBfq1qU3qlU6Y1sd2bJNrz7vwXGOtcZLKk/oVHGiiERVPzLIxD2Ipo
 Lb3hSK/6h7jbJJYuQaD1W0dA+zRmKN0tEgYVA7FZVKm14bQAsBoL/tQcW7SSyqftLLSK
 5AuzUYGv2e3XUkmVtLPL+DF8dkXj+Mb46DA1cYGO4QEMYrl7JeWLtNo0EYdzRuGnDvOe
 NDdUN1GVE+GLBbFDzxLRV+UqLcuAbYsdyevFIxqXmjUFJOpVyKct17FNRZRm39Qep5MO
 opOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=q+FQpamSz/Of9ZYeTSRd7EN6g7e6t75cbQPLDwZP51E=;
 b=tnhctwVuxtuf5PDqy58xcenBTQTxvYRUjR4YgkvN22lgD5te4aez6PW3IHasBUfQWT
 L8iwsWaxGFnTECUAFjjQRtt+vmy5L6OfCY01/ykpKoH6beQossrrVRmqXvO/NicC0qgO
 Ty3Pw5X+2p05+CuFBr0HPgm2K4mbxZsR0Mo+HseFLat1ytIxgnkG/F0EjcpDDPnatNIC
 h+wGqfoLVjd+dpG0d2sdP/4gLx0brj7x5J6dnqm+hbu/e5h3dRbUfXl6hA6OuO8UayBj
 u1ulNkXvaGxtbZP18fFfWoW/Ep+QTC8ULxlb7zZDkLdUCF2es9m7jco4qEz0pTASBr0p
 vcsA==
X-Gm-Message-State: ACrzQf0YaF770bXydFV9mTnRWRKIbjyR4h4DIuGLPUMXjp9BsE34k5AZ
 XQMfi2Tit/UscNURqLZFV3RK7G4hR1lfDyfp4Ok9L0dNZXA=
X-Google-Smtp-Source: AMsMyM6vYEVoGMe6pITtA14fOwaybNhIiWt9ACBCCEAE4ULNgZdBTn/21GlzYkhjVsyQi+1DvNpWdTgLyZPhyq0msU8=
X-Received: by 2002:a17:902:ed82:b0:178:5653:ecfb with SMTP id
 e2-20020a170902ed8200b001785653ecfbmr7362012plj.58.1664519635492; Thu, 29 Sep
 2022 23:33:55 -0700 (PDT)
MIME-Version: 1.0
From: arden jay <arden.jay@gmail.com>
Date: Fri, 30 Sep 2022 14:33:44 +0800
Message-ID: <CAL2OxujDSaiGmQA+htbRrKVznKOhcX_C4oYd951ROScMnAV8wA@mail.gmail.com>
To: kgdb-bugreport@lists.sourceforge.net
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, In ARM64, kdb "ss" always keeps the same pc. For example,
 Entering kdb (current=0xffff0000c0240e40, pid 188) on processor 0 due to
 SS trap @ 0xffff800010011c84 [0]kdb> ss 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.182 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [arden.jay[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 HTML_MESSAGE           BODY: HTML included in message
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.182 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oe9az-007Ybu-Cq
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: [Kgdb-bugreport] single step
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

In ARM64, kdb "ss" always keeps the same pc. For example,

Entering kdb (current=0xffff0000c0240e40, pid 188) on processor 0 due to SS
trap @ 0xffff800010011c84
[0]kdb> ss

Entering kdb (current=0xffff0000c0240e40, pid 188) on processor 0 due to SS
trap @ 0xffff800010011c84

From the code, kgdb_arch_update_addr won't update the pc if it is not
compiled_break. Shouldn't "ss" single step to the next instruction?

Do I miss something?
-- 
cheers,
jay

_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
