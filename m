Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 002DF98AB3F
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 30 Sep 2024 19:39:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1svKMc-0000aK-FC
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 30 Sep 2024 17:39:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <corbet@lwn.net>) id 1svKMa-0000aE-PQ
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 30 Sep 2024 17:39:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sQnJ2vYgT498XXCmOFGCfblCNnKtLSSWz9NtsiNU6CQ=; b=QgkCZ9xvojJzjG1IzSzNcar6HE
 RG8fW9//qmdhRYL1+S+Z/JM3Q/Ban5aXHoJNsTD7TYWaroB7M8e8ruhOjoUTwHVh+I1x6yntr2kVx
 eEu59vfyhlXC9E39dNEja4DxHTXJzdW9LA2KeE76ZMRqzs71fOIgnQKlDOSYmPiQ1OR0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sQnJ2vYgT498XXCmOFGCfblCNnKtLSSWz9NtsiNU6CQ=; b=d9ep8qRr88SMsIKeMjz+MEl3iy
 X+YDm8PhpTpCOX6pG0RMsGzozDtEelAZ1QCyf9VYUts4JSyvQbVEOkw/6Z6yEDreHLXhvT80Vj3uk
 i1l118k+V5nqYnOW0t4v0o3TSP28AohwWyalqhKyY694F8XmDJvInkGvl3qdUx5ilS50=;
Received: from ms.lwn.net ([45.79.88.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1svKMa-0002nk-PK for kgdb-bugreport@lists.sourceforge.net;
 Mon, 30 Sep 2024 17:39:13 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2A60F42BFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1727716914; bh=sQnJ2vYgT498XXCmOFGCfblCNnKtLSSWz9NtsiNU6CQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=cUoErctkcwoPXi21RUc/Oxl+yiqOZwiR2zeEcf5C70lMQkMhOARq8DBtQAPd2ydHq
 ZR8mhhKH7f6e7KgYTNztDh851DXhPOZepfHTU51PgQ8QI030k8tMPcb34XtggkS2Bb
 hgBU2hArwX9tcRjLIH5s0XCll5ptxDr9usajzxLTcJugoOc7MyOXP0wzTq7uD1dGOd
 AFX3D9Dqd5s6s6r4OQmPDbdgo8TvJiNPWSMeGt2RHpPBFkYrKpQVFaLhF2ROYFz8nl
 MX486gF0FQN3y6WJC2B9/X8x7Bw6L9IIKLIgS2+zxBSc7y8uRnm1K5DIptkUYIkt/4
 pjeBgYfle1LtQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 2A60F42BFE;
 Mon, 30 Sep 2024 17:21:52 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Thompson <daniel.thompson@linaro.org>, Changhuang Liang
 <changhuang.liang@starfivetech.com>
In-Reply-To: <20240930092907.GD5584@aspen.lan>
References: <20240925100742.1730576-1-changhuang.liang@starfivetech.com>
 <20240930092907.GD5584@aspen.lan>
Date: Mon, 30 Sep 2024 11:21:49 -0600
Message-ID: <87ed519hw2.fsf@trenco.lwn.net>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Daniel Thompson <daniel.thompson@linaro.org> writes: > On
 Wed, Sep 25, 2024 at 03:07:42AM -0700, Changhuang Liang wrote: >> Module kgdb
 had been converted to debug_core since commit c433820971ff >> ("Move
 kernel/kgdb.c to kernel/debug/debug_core.c") be [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [45.79.88.28 listed in list.dnswl.org]
X-Headers-End: 1svKMa-0002nk-PK
Subject: Re: [Kgdb-bugreport] [PATCH v3] Documentation: kgdb: Correct
 parameter error
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
Cc: linux-doc@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Daniel Thompson <daniel.thompson@linaro.org> writes:

> On Wed, Sep 25, 2024 at 03:07:42AM -0700, Changhuang Liang wrote:
>> Module kgdb had been converted to debug_core since commit c433820971ff
>> ("Move kernel/kgdb.c to kernel/debug/debug_core.c") be added, so let's
>> correct the module parameter path.
>>
>> Fixes: c433820971ff ("Move kernel/kgdb.c to kernel/debug/debug_core.c")
>> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
>
> @Jon: Do you want me to hoover this up or will you take it? If you are
> happy to grab it then feel free to treat my Rb: as an Acked-by: too!

Sure, I can grab it in a bit.

Thanks,

jon


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
