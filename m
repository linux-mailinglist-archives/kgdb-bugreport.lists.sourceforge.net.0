Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3290530B09
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 23 May 2022 10:19:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nt3I5-0000ew-SC
	for lists+kgdb-bugreport@lfdr.de; Mon, 23 May 2022 08:19:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <longman@redhat.com>) id 1ns8ff-0001zK-AZ
 for kgdb-bugreport@lists.sourceforge.net; Fri, 20 May 2022 19:52:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QC4HhoSa5ax5VuJxdudrkP+hQQcM6Ir26+NRsLLyTuA=; b=W9PZY65a/BcQA/PvXuF6TzZ/A7
 qtLeS2qJ7qloZk+Y8PXhgIb0QX/JW4sWugirspYng2kQQDVDje17bawwAPZF4g4IqpdpDcgLcjJQA
 zlhjPkPTKy9TtNDVO3p/QjP2wsyFJcMaSHWoh36Zhdm6D5ScDo38jjOqGtgP0q0MrjeM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QC4HhoSa5ax5VuJxdudrkP+hQQcM6Ir26+NRsLLyTuA=; b=fWkVzZxVIyhvU2iLtxcmtxvRCG
 ekks9ToLdzuIyrtjqVHZIBf71PEzxuwpyhHahf4faWuqz5ZnLWyNVleCpoRjv6VGYIOY9MjJBtx4g
 WM4zJsLOmys1dy8vUmFGa1XKqZVHnWXR+etDbuPETlt7oQpHmRL/eIXTLi+T/On2O96s=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ns8fZ-00DkKX-6Z
 for kgdb-bugreport@lists.sourceforge.net; Fri, 20 May 2022 19:52:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653076330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QC4HhoSa5ax5VuJxdudrkP+hQQcM6Ir26+NRsLLyTuA=;
 b=Gcyu2HAcY32dWkxlRvim23nIwdoVjm8pF3UQoFSWlH42gM17kS9lzPs3+TY9wW4BFG8Yfo
 2czn9plS4mJEqO7+dhNe4zm2XUv0Rk99bWPndA5yXmwmrSqbOrCLQVq6sfjFnqBpiFEIQ0
 L1/huIquOGDBwjm1T5gAYXDYUf96SBU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-4t-3E9E5PQGx31S7cEd1eQ-1; Fri, 20 May 2022 15:52:06 -0400
X-MC-Unique: 4t-3E9E5PQGx31S7cEd1eQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AC1829AB3FB;
 Fri, 20 May 2022 19:52:04 +0000 (UTC)
Received: from [10.22.32.226] (unknown [10.22.32.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED99440D2821;
 Fri, 20 May 2022 19:52:01 +0000 (UTC)
Message-ID: <f3627eae-f5ae-1d30-2c09-1820a255334a@redhat.com>
Date: Fri, 20 May 2022 15:52:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Maninder Singh <maninder1.s@samsung.com>, keescook@chromium.org,
 pmladek@suse.com, bcain@quicinc.com, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
 svens@linux.ibm.com, satishkh@cisco.com, sebaddel@cisco.com,
 kartilak@cisco.com, jejb@linux.ibm.com, martin.petersen@oracle.com,
 mcgrof@kernel.org, jason.wessel@windriver.com, daniel.thompson@linaro.org,
 dianders@chromium.org, naveen.n.rao@linux.ibm.com,
 anil.s.keshavamurthy@intel.com, davem@davemloft.net, mhiramat@kernel.org,
 peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 boqun.feng@gmail.com, rostedt@goodmis.org, senozhatsky@chromium.org,
 andriy.shevchenko@linux.intel.com, linux@rasmusvillemoes.dk,
 akpm@linux-foundation.org, arnd@arndb.de
References: <20220520083701.2610975-1-maninder1.s@samsung.com>
 <CGME20220520083725epcas5p1c3e2989c991e50603a40c81ccc4982e0@epcas5p1.samsung.com>
 <20220520083701.2610975-2-maninder1.s@samsung.com>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20220520083701.2610975-2-maninder1.s@samsung.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/20/22 04:36, Maninder Singh wrote: > As of now sprint_*
 APIs don't pass buffer size as an argument > and use sprintf directly. >
 > To replace dangerous sprintf API to scnprintf, > buffer size is [...] 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [170.10.133.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.7 NICE_REPLY_A           Looks like a legit reply (A)
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ns8fZ-00DkKX-6Z
X-Mailman-Approved-At: Mon, 23 May 2022 08:19:48 +0000
Subject: Re: [Kgdb-bugreport] [PATCH 1/5] kallsyms: pass buffer size in
 sprint_* APIs
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
Cc: v.narang@samsung.com, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-kernel@vger.kernel.org, onkarnath.1@samsung.com,
 kgdb-bugreport@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gNS8yMC8yMiAwNDozNiwgTWFuaW5kZXIgU2luZ2ggd3JvdGU6Cj4gQXMgb2Ygbm93IHNwcmlu
dF8qIEFQSXMgZG9uJ3QgcGFzcyBidWZmZXIgc2l6ZSBhcyBhbiBhcmd1bWVudAo+IGFuZCB1c2Ug
c3ByaW50ZiBkaXJlY3RseS4KPgo+IFRvIHJlcGxhY2UgZGFuZ2Vyb3VzIHNwcmludGYgQVBJIHRv
IHNjbnByaW50ZiwKPiBidWZmZXIgc2l6ZSBpcyByZXF1aXJlZCBpbiBhcmd1bWVudHMuCj4KPiBD
by1kZXZlbG9wZWQtYnk6IE9ua2FybmF0aCA8b25rYXJuYXRoLjFAc2Ftc3VuZy5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogT25rYXJuYXRoIDxvbmthcm5hdGguMUBzYW1zdW5nLmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBNYW5pbmRlciBTaW5naCA8bWFuaW5kZXIxLnNAc2Ftc3VuZy5jb20+Cj4gLS0tCj4g
ICBhcmNoL3MzOTAvbGliL3Rlc3RfdW53aW5kLmMgICAgfCAgMiArLQo+ICAgZHJpdmVycy9zY3Np
L2ZuaWMvZm5pY190cmFjZS5jIHwgIDggKysrKy0tLS0KPiAgIGluY2x1ZGUvbGludXgva2FsbHN5
bXMuaCAgICAgICB8IDIwICsrKysrKysrKystLS0tLS0tLS0tCj4gICBpbml0L21haW4uYyAgICAg
ICAgICAgICAgICAgICAgfCAgMiArLQo+ICAga2VybmVsL2thbGxzeW1zLmMgICAgICAgICAgICAg
IHwgMjcgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tCj4gICBrZXJuZWwvdHJhY2UvdHJhY2Vf
b3V0cHV0LmMgICAgfCAgMiArLQo+ICAgbGliL3ZzcHJpbnRmLmMgICAgICAgICAgICAgICAgIHwg
MTAgKysrKystLS0tLQo+ICAgNyBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspLCAzMyBk
ZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3MzOTAvbGliL3Rlc3RfdW53aW5kLmMg
Yi9hcmNoL3MzOTAvbGliL3Rlc3RfdW53aW5kLmMKPiBpbmRleCA1YTA1M2IzOTNkNWMuLmFkYmMy
YjUzZGIxNiAxMDA2NDQKPiAtLS0gYS9hcmNoL3MzOTAvbGliL3Rlc3RfdW53aW5kLmMKPiArKysg
Yi9hcmNoL3MzOTAvbGliL3Rlc3RfdW53aW5kLmMKPiBAQCAtNzUsNyArNzUsNyBAQCBzdGF0aWMg
bm9pbmxpbmUgaW50IHRlc3RfdW53aW5kKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaywgc3RydWN0
IHB0X3JlZ3MgKnJlZ3MsCj4gICAJCQlyZXQgPSAtRUlOVkFMOwo+ICAgCQkJYnJlYWs7Cj4gICAJ
CX0KPiAtCQlzcHJpbnRfc3ltYm9sKHN5bSwgYWRkcik7Cj4gKwkJc3ByaW50X3N5bWJvbChzeW0s
IEtTWU1fU1lNQk9MX0xFTiwgYWRkcik7CgpJbnN0ZWFkIG9mIGhhcmRjb2RpbmcgS1NZTV9TWU1C
T0xfTEVOIGV2ZXJ5d2hlcmUsIHdpbGwgaXQgYmV0dGVyIHRvIGhpZGUgCml0IGxpa2UgdGhpczoK
CiDCoMKgwqDCoMKgwqDCoCBleHRlcm4gaW50IF9fc3ByaW50X3N5bWJvbChjaGFyICpidWZmZXIs
IHNpemVfdCBzaXplLCB1bnNpZ25lZCAKbG9uZyBhZGRyZXNzKTsKIMKgwqDCoMKgwqDCoMKgICNk
ZWZpbmUgc3ByaW50X3N5bWJvbChidWYsIGFkZHIpwqDCoMKgwqDCoMKgwqAgX19zcHJpbnRfc3lt
Ym9sKGJ1ZiwgCnNpemVvZihidWYpLCBhZGRyKQoKT3IgeW91IGNhbiB1c2Ugc2l6ZW9mKGJ1Zikg
ZGlyZWN0bHkgaW5zdGVhZCBvZiBLU1lNX1NZTUJPTF9MRU4uCgpDaGVlcnMsCkxvbmdtYW4KCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdy
ZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9y
dAo=
